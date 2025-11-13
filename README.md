# Body Heatmap

Interactive body heatmap component for visualizing muscle engagement. Available for both **SwiftUI (iOS)** and **Web (HTML/JS)**.

**[Live Web Demo](https://chiejina.github.io/Body-Heatmap-Repo/)**

## Installation

### SwiftUI (iOS App)

**Option 1: Swift Package Manager (Recommended)**
```swift
// In Xcode: File → Add Package Dependencies
// Paste: https://github.com/chiejina/Body-Heatmap-Repo

import BodyHeatmap

struct ContentView: View {
    var body: some View {
        StandaloneBodyHeatmap()
    }
}
```

**Option 2: Manual Installation**
- See [`swiftui-demo/`](swiftui-demo/) folder
- Copy files to your Xcode project
- Full instructions in [swiftui-demo/README.md](swiftui-demo/README.md)

### Web (HTML/JavaScript)

1. Open [`web-demo/index.html`](web-demo/index.html) directly in a browser
2. Or run with a local server:
```bash
cd web-demo
python3 -m http.server 8000
# Open http://localhost:8000
```

See [web-demo/README.md](web-demo/README.md) for details.

## Repository Structure

```
Body-Heatmap-Repo/
├── swiftui-demo/          # SwiftUI version (iOS)
│   ├── StandaloneBodyHeatmap.swift
│   ├── Muscles-simplified.svg
│   └── README.md
├── web-demo/              # Web version (HTML/JS)
│   ├── index.html
│   ├── Muscles-simplified.svg
│   └── README.md
├── Sources/               # Swift Package Manager structure
│   └── BodyHeatmap/
├── Package.swift          # SPM manifest
├── README.md             # This file
└── INSTALLATION.md       # Detailed installation guide
```

## Customization

### SwiftUI
Modify colors in the `updateMuscleColors()` method:
```swift
let color = isToggled ? "rgba(255, 0, 0, 0.7)" : "__reset__"
```

### Web
Modify CSS and JavaScript in `web-demo/index.html`:
```javascript
element.style.fill = 'rgba(255, 100, 100, 0.8)';
```

## Muscle Group Mapping

Both versions include 24 clickable muscle groups:

| Category | Muscles |
|----------|---------|
| **Chest** | Upper/Middle/Lower Pecs |
| **Back** | Upper Traps, Lower Traps, Rhomboids, Lats, Lower Back |
| **Shoulders** | Front/Side/Rear Deltoids |
| **Arms** | Biceps, Triceps, Forearms |
| **Core** | Upper Abs, Lower Abs, Obliques |
| **Legs** | Quadriceps, Hamstrings, Glutes, Calves |
| **Other** | Hip Adductors, Hip Abductors, Neck |

## Requirements

### SwiftUI Version
- iOS 15.0+
- Xcode 13.0+
- Swift 5.9+

### Web Version
- Modern web browser (Chrome, Firefox, Safari, Edge)
- No build tools or dependencies required

## Documentation

- [INSTALLATION.md](INSTALLATION.md) - Detailed installation for both platforms
- [swiftui-demo/README.md](swiftui-demo/README.md) - SwiftUI-specific guide
- [web-demo/README.md](web-demo/README.md) - Web version guide

## License

MIT License
