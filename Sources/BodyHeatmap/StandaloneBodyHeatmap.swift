import SwiftUI
import WebKit

// MARK: - Standalone Interactive SVG Body Heatmap
// Available as a Swift Package Manager library
// Installation: Add package dependency with your repo URL in Xcode

// MARK: - Models (Copy these if not already in your project)

public struct MuscleGroupStats {
    public let muscleGroup: String
    public let workoutCount: Int
    public let exerciseCount: Int
    public let totalSets: Int
    public let totalVolume: Double
    public let percentage: Double

    public var intensity: Double {
        percentage / 100.0
    }

    public var color: Color {
        if intensity == 0 { return .clear }
        if intensity < 0.2 { return Color.blue.opacity(0.2) }
        if intensity < 0.4 { return Color.green.opacity(0.4) }
        if intensity < 0.6 { return Color.yellow.opacity(0.6) }
        if intensity < 0.8 { return Color.orange.opacity(0.7) }
        return Color.red.opacity(0.8)
    }

    public init(muscleGroup: String, workoutCount: Int, exerciseCount: Int, totalSets: Int, totalVolume: Double, percentage: Double) {
        self.muscleGroup = muscleGroup
        self.workoutCount = workoutCount
        self.exerciseCount = exerciseCount
        self.totalSets = totalSets
        self.totalVolume = totalVolume
        self.percentage = percentage
    }
}

public struct MuscleGroupMapping {
    public static let svgToAppMapping: [String: String] = [
        "upper_pecs": "Chest", "middle_pecs": "Chest", "lower_pecs": "Chest",
        "upper_traps": "Upper Back", "lower_traps": "Upper Back", "rhomboids": "Upper Back", "lats": "Upper Back",
        "lower_back": "Lower Back",
        "front_delts": "Shoulders", "side_delts": "Shoulders", "rear_delts": "Shoulders",
        "biceps": "Biceps", "triceps": "Triceps", "forearms": "Forearms",
        "upper_abs": "Abs", "lower_abs": "Abs", "obliques": "Core",
        "quads": "Quads", "hamstrings": "Hamstrings", "glutes": "Glutes", "calves": "Calves",
        "hip_adductor": "Quads", "hip_abductor": "Glutes", "neck": "Full Body"
    ]

    public static let appToSvgMapping: [String: [String]] = {
        var mapping: [String: [String]] = [:]
        for (svgId, appGroup) in svgToAppMapping {
            if mapping[appGroup] == nil { mapping[appGroup] = [] }
            mapping[appGroup]?.append(svgId)
        }
        return mapping
    }()

    public static func svgIds(for muscleGroup: String) -> [String] {
        return appToSvgMapping[muscleGroup] ?? []
    }

    public static func appMuscleGroup(for svgId: String) -> String? {
        return svgToAppMapping[svgId]
    }
}

// MARK: - Main View
public struct StandaloneBodyHeatmap: View {
    @State private var toggledMuscles: Set<String> = []
    @State private var selectedMuscle: String?
    private let muscleGridColumns: [GridItem] = [
        GridItem(.adaptive(minimum: 140), spacing: 10)
    ]

    public init() {}

    public var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Text("Body Heatmap")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                // Interactive SVG Body
                StandaloneSVGBodyWebView(
                    toggledMuscles: $toggledMuscles,
                    selectedMuscle: $selectedMuscle
                )
                .frame(height: 420)
                .padding(.horizontal)
                .padding(.bottom, -24)

                // Selected muscle info
                if let muscle = selectedMuscle {
                    VStack(spacing: 12) {
                        HStack {
                            Text(muscle)
                                .font(.headline)
                            Spacer()
                            Text(toggledMuscles.contains(muscle) ? "Selected" : "Not Selected")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(UIColor.tertiarySystemBackground))
                    )
                    .padding(.horizontal)
                }

                // Clear button
                if !toggledMuscles.isEmpty {
                    Button("Clear All Selections") {
                        toggledMuscles.removeAll()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }

                // Muscle list
                VStack(alignment: .leading, spacing: 8) {
                    Text("Muscle Groups")
                        .font(.headline)
                        .padding(.horizontal)

                    let allMuscles = Set(MuscleGroupMapping.svgToAppMapping.values).sorted()

                    LazyVGrid(columns: muscleGridColumns, alignment: .leading, spacing: 12) {
                        ForEach(allMuscles, id: \.self) { muscle in
                            Button(action: {
                                if toggledMuscles.contains(muscle) {
                                    toggledMuscles.remove(muscle)
                                } else {
                                    toggledMuscles.insert(muscle)
                                }
                                selectedMuscle = muscle
                            }) {
                                HStack(spacing: 10) {
                                    Circle()
                                        .fill(toggledMuscles.contains(muscle) ? Color.blue : Color.gray.opacity(0.3))
                                        .frame(width: 18, height: 18)

                                    Text(muscle)
                                        .foregroundColor(.primary)

                                    Spacer(minLength: 0)

                                    if toggledMuscles.contains(muscle) {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.blue)
                                    }
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 12)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color(UIColor.secondarySystemBackground))
                                )
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 4)
                .padding(.bottom)
            }
        }
    }
}

// MARK: - SVG Body WebView
struct StandaloneSVGBodyWebView: UIViewRepresentable {
    @Binding var toggledMuscles: Set<String>
    @Binding var selectedMuscle: String?

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.scrollView.isScrollEnabled = false
        webView.backgroundColor = .clear
        webView.isOpaque = false

        webView.configuration.userContentController.add(
            context.coordinator,
            name: "muscleClicked"
        )

        loadSVG(in: webView)
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        updateMuscleColors(in: webView)
    }

    private func loadSVG(in webView: WKWebView) {
        guard let svgURL = Bundle.module.url(forResource: "Muscles-simplified", withExtension: "svg"),
              let svgData = try? Data(contentsOf: svgURL),
              let svgString = String(data: svgData, encoding: .utf8) else {
            return
        }

        let html = """
        <!DOCTYPE html>
        <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
            <style>
                body {
                    margin: 0;
                    padding: 0;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    background: transparent;
                }
                svg {
                    max-width: 100%;
                    height: auto;
                }
                svg g[id]:not([id="front_borders"]):not([id="rear_borders"]):not([id="front"]):not([id="rear"]):not([id="face"]) {
                    cursor: pointer;
                }
            </style>
        </head>
        <body>
            \(svgString)
            <script>
                const muscleGroups = [
                    'obliques', 'quads', 'lower_abs', 'upper_abs', 'biceps',
                    'side_delts', 'front_delts', 'upper_pecs', 'rear_delts',
                    'lower_pecs', 'middle_pecs', 'hamstrings', 'rhomboids',
                    'lower_back', 'hip_abductor', 'neck', 'upper_traps',
                    'lower_traps', 'forearms', 'triceps', 'glutes', 'calves',
                    'lats', 'hip_adductor'
                ];

                const defaultColors = {};

                function cacheOriginalColors(muscleId) {
                    const element = document.getElementById(muscleId);
                    if (!element) { return; }
                    const paths = element.querySelectorAll('path');
                    defaultColors[muscleId] = Array.from(paths).map(path => {
                        const fill = window.getComputedStyle(path).fill;
                        return fill === 'none' ? '' : fill;
                    });
                }

                muscleGroups.forEach(id => {
                    const element = document.getElementById(id);
                    if (element) {
                        cacheOriginalColors(id);
                        element.addEventListener('click', () => {
                            window.webkit.messageHandlers.muscleClicked.postMessage(id);
                        });
                    }
                });

                function setMuscleColor(muscleId, color) {
                    const element = document.getElementById(muscleId);
                    if (element) {
                        const paths = element.querySelectorAll('path');
                        if (!defaultColors[muscleId]) {
                            cacheOriginalColors(muscleId);
                        }
                        paths.forEach((path, index) => {
                            if (color === '__reset__') {
                                const original = defaultColors[muscleId]?.[index];
                                if (original && original.length > 0) {
                                    path.style.fill = original;
                                } else {
                                    path.style.removeProperty('fill');
                                }
                            } else {
                                path.style.fill = color;
                            }
                        });
                    }
                }

                window.setMuscleColor = setMuscleColor;
            </script>
        </body>
        </html>
        """

        webView.loadHTMLString(html, baseURL: nil)
    }

    private func updateMuscleColors(in webView: WKWebView) {
        let allMuscleGroups = Set(MuscleGroupMapping.svgToAppMapping.values)
        let isFullBodySelected = toggledMuscles.contains("Full Body")

        for appMuscle in allMuscleGroups {
            let isToggled = isFullBodySelected || toggledMuscles.contains(appMuscle)
            let color = isToggled ? "rgba(0, 122, 255, 0.7)" : "__reset__"
            let svgIds = MuscleGroupMapping.svgIds(for: appMuscle)

            for svgId in svgIds {
                let script = "setMuscleColor('\(svgId)', '\(color)');"
                webView.evaluateJavaScript(script)
            }
        }
    }

    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
        let parent: StandaloneSVGBodyWebView

        init(parent: StandaloneSVGBodyWebView) {
            self.parent = parent
        }

        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if message.name == "muscleClicked", let svgId = message.body as? String {
                if let appMuscle = MuscleGroupMapping.appMuscleGroup(for: svgId) {
                    DispatchQueue.main.async {
                        if self.parent.toggledMuscles.contains(appMuscle) {
                            self.parent.toggledMuscles.remove(appMuscle)
                        } else {
                            self.parent.toggledMuscles.insert(appMuscle)
                        }
                        self.parent.selectedMuscle = appMuscle
                    }
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    NavigationView {
        StandaloneBodyHeatmap()
    }
}
