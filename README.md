# Body Heatmap

Interactive body heatmap component for visualizing muscle engagement. Available for both **SwiftUI (iOS)** and **Web (HTML/JS)**.

Perfect for fitness apps, workout trackers, exercise analytics, and training visualizations.

🌐 **[Live Web Demo](https://chiejina.github.io/Body-Heatmap-Repo/web-demo/)** - Try it now!

![Body Heatmap Demo](demo.png)

## 🚀 Quick Start

Choose your platform:

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

**Try it live:**
🌐 **[Live Demo](https://chiejina.github.io/Body-Heatmap-Repo/web-demo/)** - See it in action!

**Or use locally:**
1. Open [`web-demo/index.html`](web-demo/index.html) in your browser
2. Click on muscles to see their names
3. Full instructions in [web-demo/README.md](web-demo/README.md)

**Run with local server:**
```bash
cd web-demo
python3 -m http.server 8000
# Open http://localhost:8000
```

## 📁 Repository Structure

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

## ✨ Features

### SwiftUI Version
- ✅ **Fully Interactive** - Click on body parts to toggle selection
- ✅ **Swift Package Manager** - Easy installation
- ✅ **Zero Dependencies** - Pure SwiftUI + WebKit
- ✅ **Customizable** - Colors, muscle groups, data-driven
- ✅ **iOS 15+** - iPhone and iPad support
- ✅ **Live Preview** - Test in Xcode Canvas

### Web Version
- ✅ **Pure HTML/CSS/JS** - No frameworks needed
- ✅ **Click to Display** - Shows muscle names on click
- ✅ **Responsive Design** - Works on all screen sizes
- ✅ **Beautiful UI** - Modern gradient design
- ✅ **All Browsers** - Chrome, Firefox, Safari, Edge

## 🎯 Use Cases

- **Fitness Apps** - Visualize which muscles were worked
- **Workout Trackers** - Show training focus over time
- **Exercise Libraries** - Display target muscles for exercises
- **Physical Therapy** - Track rehabilitation progress
- **Educational Tools** - Teach anatomy and muscle groups
- **Training Plans** - Help users balance muscle group training

## 📦 Installation

### SwiftUI - Swift Package Manager

1. In Xcode: **File → Add Package Dependencies...**
2. Paste: `https://github.com/chiejina/Body-Heatmap-Repo`
3. Click **Add Package**
4. Import and use:

```swift
import BodyHeatmap

struct MyView: View {
    var body: some View {
        NavigationView {
            StandaloneBodyHeatmap()
        }
    }
}
```

### SwiftUI - Manual Installation

See detailed instructions in [swiftui-demo/README.md](swiftui-demo/README.md)

1. Copy `swiftui-demo/StandaloneBodyHeatmap.swift` to your project
2. Add `swiftui-demo/Muscles-simplified.svg` to Assets.xcassets
3. Use in your SwiftUI views

### Web - Direct Use

1. Download or clone this repo
2. Open `web-demo/index.html` in your browser
3. That's it!

For more details, see [INSTALLATION.md](INSTALLATION.md)

## 🎨 Customization

### SwiftUI - Change Colors

```swift
// In updateMuscleColors() method
let color = isToggled ? "rgba(255, 0, 0, 0.7)" : "__reset__"  // Red highlight
```

### SwiftUI - Data-Driven Heatmap

```swift
// Drive colors based on workout intensity
let stats = calculateMuscleStats(from: workoutLogs)
// Use stats to color muscles by intensity
```

### Web - Customize Appearance

```javascript
// In index.html, modify the CSS gradient
background: linear-gradient(135deg, #ff6b6b 0%, #4ecdc4 100%);

// Change muscle colors on click
element.style.fill = 'rgba(255, 100, 100, 0.8)';
```

## 🗺️ Muscle Group Mapping

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

## 💻 Requirements

### SwiftUI Version
- iOS 15.0+
- Xcode 13.0+
- Swift 5.9+

### Web Version
- Any modern web browser
- No build tools required
- Works offline

## 📚 Documentation

- [INSTALLATION.md](INSTALLATION.md) - Detailed installation for both platforms
- [swiftui-demo/README.md](swiftui-demo/README.md) - SwiftUI-specific guide
- [web-demo/README.md](web-demo/README.md) - Web version guide

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest new features
- Submit pull requests
- Improve documentation

## 🚀 Deploy Your Own Live Demo

Want to host the web demo on GitHub Pages?

1. **Fork or push this repo to GitHub**
2. **Enable GitHub Pages:**
   - Go to your repo **Settings** → **Pages**
   - Under **Source**, select your branch (main/master)
   - Click **Save**
3. **Wait 2-3 minutes**, then visit:
   - `https://chiejina.github.io/Body-Heatmap-Repo/web-demo/`

**Alternative hosting options:**
- **Netlify**: Drag & drop the `web-demo` folder → Instant deploy
- **Vercel**: Connect your GitHub repo → Auto-deploy
- **Any static host**: Upload `web-demo` folder via FTP

## 📄 License

MIT License - Feel free to use in your projects!

## 🙋 Support

- **Issues**: Open an issue on GitHub
- **Questions**: Check the documentation in each demo folder
- **Feature Requests**: Submit an issue with the "enhancement" label

---

**Choose Your Platform:**
- 📱 **iOS App?** → Use SwiftUI version (SPM or manual)
- 🌐 **Website?** → Use Web version (HTML/JS)
- 🎯 **Both?** → All files included!

Made with ❤️ for the fitness and health app community
