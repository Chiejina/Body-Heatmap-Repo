# Body Heatmap - SwiftUI Demo

A self-contained SwiftUI component for visualizing muscle engagement on a human body diagram. Perfect for fitness apps, workout trackers, and exercise analytics.

## Quick Start

### Step 1: Add the SVG to Your Asset Catalog

1. Open your Xcode project
2. In the Project Navigator, find your **Assets.xcassets** folder
3. Right-click → **New Image Set**
4. Rename it to: `Muscles-simplified`
5. In the Attributes Inspector, set **Render As** to "Original Image"
6. Drag `Muscles-simplified.svg` from this folder into the **Universal** slot

### Step 2: Add the Swift File

1. In Xcode, right-click your project folder
2. Select **Add Files to "[YourProject]"**
3. Select `StandaloneBodyHeatmap.swift` from this folder
4. Make sure **"Copy items if needed"** is checked
5. Click **Add**

### Step 3: Use the Component

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            StandaloneBodyHeatmap()
        }
    }
}
```

### Step 4: Preview in Xcode

1. Open `StandaloneBodyHeatmap.swift` in Xcode
2. Press `⌥⌘↩` (Option + Command + Return) to show the Canvas
3. Click **Resume** to see the live preview
4. Click the play button to make it interactive

## Features

- ✅ Fully Interactive - Click on body parts or muscle groups to toggle selection
- ✅ Self-Contained - Single Swift file + SVG asset
- ✅ Zero Dependencies - Pure SwiftUI + WebKit
- ✅ Customizable - Easy to adapt colors and data
- ✅ Responsive - Works on iPhone and iPad
- ✅ Muscle Mapping - 24 SVG muscle groups → 13 app categories

## Requirements

- iOS 15.0+
- Xcode 13.0+
- SwiftUI

## Customization

### Change Highlight Color

In `updateMuscleColors()` around line 298:
```swift
let color = isToggled ? "rgba(255, 0, 0, 0.7)" : "__reset__"  // Red instead of blue
```

### Adjust Body Size

In `StandaloneBodyHeatmap.body` around line 83:
```swift
StandaloneSVGBodyWebView(...)
    .frame(height: 500)  // Change from 420
```

### Modify Muscle Groups

In `MuscleGroupMapping.svgToAppMapping` around line 42:
```swift
static let svgToAppMapping: [String: String] = [
    "upper_pecs": "Your Custom Group",
    // ... modify mappings
]
```

## Troubleshooting

**SVG not loading?**
- Verify the SVG is named exactly `Muscles-simplified` in Assets.xcassets
- Make sure it's in the same target as your Swift file
- Clean build: Cmd + Shift + K, then rebuild

**Preview not working?**
- Make sure you're using iOS 15+ as deployment target
- Try clicking Resume in the Canvas
- Press Cmd + Option + P to refresh preview

## Files

- `StandaloneBodyHeatmap.swift` - Main SwiftUI component (12.8 KB)
- `Muscles-simplified.svg` - Body diagram (58 KB)
- `README.md` - This file

## Alternative: Swift Package Manager

If you prefer using Swift Package Manager instead of manual installation, use the main repository package at the root level. See the main README for SPM instructions.

## License

MIT License - Feel free to use in your projects!
