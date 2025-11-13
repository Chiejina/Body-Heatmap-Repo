# Installation Guide

Choose your platform below for detailed installation instructions.

---

## 📱 SwiftUI (iOS App)

### Method 1: Swift Package Manager (Recommended - 2 minutes)

**Step 1: Add Package Dependency**

1. Open your Xcode project
2. Go to **File → Add Package Dependencies...**
3. In the search bar, paste: `https://github.com/chiejina/Body-Heatmap-Repo`
4. Click **Add Package**
5. Select your app target and click **Add Package** again

**Step 2: Import and Use**

```swift
import SwiftUI
import BodyHeatmap  // Import the package

struct ContentView: View {
    var body: some View {
        NavigationView {
            StandaloneBodyHeatmap()
        }
    }
}
```

That's it! The SVG asset is automatically included. ✅

---

### Method 2: Manual Installation (5 minutes)

Use this if you prefer not to use Swift Package Manager.

**Step 1: Get the Files**

1. Download or clone this repository
2. Navigate to the `swiftui-demo/` folder
3. You'll need:
   - `StandaloneBodyHeatmap.swift`
   - `Muscles-simplified.svg`

**Step 2: Add the SVG to Asset Catalog**

1. Open your Xcode project
2. In the Project Navigator (left sidebar), find your **Assets.xcassets** folder
3. Right-click on **Assets.xcassets** → **New Image Set**
4. Select the new image set and rename it to: `Muscles-simplified`
5. In the Attributes Inspector (right sidebar), set **Render As** to "Original Image"
6. Drag `Muscles-simplified.svg` from `swiftui-demo/` into the **Universal** slot

**Step 3: Add the Swift File**

1. In Xcode, right-click your project folder
2. Select **Add Files to "[YourProject]"**
3. Navigate to `swiftui-demo/` and select `StandaloneBodyHeatmap.swift`
4. Make sure **"Copy items if needed"** is **checked**
5. Click **Add**

**Step 4: Use the Component**

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

**Step 5: Preview in Xcode**

1. Open `StandaloneBodyHeatmap.swift`
2. Press `⌥⌘↩` (Option + Command + Return) to show Canvas
3. Click **Resume** to see live preview
4. Click the play button to make it interactive

---

## 🌐 Web (HTML/JavaScript)

### Super Simple Installation (30 seconds)

**Option 1: Direct Open**

1. Download or clone this repository
2. Navigate to the `web-demo/` folder
3. Double-click `index.html`
4. It opens in your browser - start clicking muscles! ✅

**Option 2: Run Local Server (Recommended)**

For better performance and to avoid CORS issues:

```bash
# Navigate to web-demo folder
cd web-demo

# Using Python 3 (recommended)
python3 -m http.server 8000

# Using Python 2
python -m SimpleHTTPServer 8000

# Using Node.js
npx http-server

# Using PHP
php -S localhost:8000
```

Then open `http://localhost:8000` in your browser.

**Option 3: Deploy to Web Hosting**

Simply upload the entire `web-demo/` folder to your web server:
- Upload via FTP/SFTP
- Deploy to GitHub Pages
- Host on Netlify/Vercel (drag & drop)
- Use any static hosting service

The web version has **zero dependencies** - just HTML, CSS, and JavaScript!

---

## 📦 What's Included

### SwiftUI Demo (`swiftui-demo/`)
- `StandaloneBodyHeatmap.swift` - Main component (12.8 KB)
- `Muscles-simplified.svg` - Body diagram (58 KB)
- `README.md` - SwiftUI-specific guide

### Web Demo (`web-demo/`)
- `index.html` - Complete interactive page (7.9 KB)
- `Muscles-simplified.svg` - Body diagram (58 KB)
- `README.md` - Web-specific guide

### Swift Package (Root)
- `Package.swift` - SPM manifest
- `Sources/BodyHeatmap/` - Package source files
- For advanced users wanting SPM integration

---

## 🎯 Next Steps

### For SwiftUI
- Customize colors (see README.md)
- Add data-driven muscle highlighting
- Integrate with your workout data
- Check swiftui-demo/README.md for details

### For Web
- Customize the CSS gradient and colors
- Add muscle highlighting/selection features
- Integrate with your backend API
- Modify the muscle mapping

---

## 💡 Quick Comparison

| Feature | SwiftUI (SPM) | SwiftUI (Manual) | Web |
|---------|---------------|------------------|-----|
| Installation Time | 2 min | 5 min | 30 sec |
| Dependencies | None | None | None |
| Platform | iOS 15+ | iOS 15+ | Any Browser |
| Updates | Auto (SPM) | Manual | Manual |
| Customization | Full | Full | Full |
| Difficulty | Easy | Easy | Very Easy |

---

## 🙋 Need Help?

- Check the specific README in each demo folder
- Open an issue on GitHub with:
  - Platform (SwiftUI or Web)
  - Installation method
  - Error messages or screenshots
  - Xcode/Browser version

---

**Happy coding!** Choose the platform that works for you and start building amazing body heatmap visualizations! 🎉
