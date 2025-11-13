# Body Heatmap - Web Demo

A simple HTML/JavaScript version of the interactive body heatmap. Click on muscle groups to see their names!

## How to Use

### Option 1: Open Locally
1. Download or clone this repository
2. Navigate to the `web-demo` folder
3. Open `index.html` in your web browser (double-click the file)

### Option 2: Run with a Local Server
For better performance and to avoid CORS issues:

```bash
# Using Python 3
python3 -m http.server 8000

# Using Python 2
python -m SimpleHTTPServer 8000

# Using Node.js (npx)
npx http-server

# Using PHP
php -S localhost:8000
```

Then open `http://localhost:8000` in your browser.

## Features

- ✅ Click on any muscle group to see its name
- ✅ Hover effects for visual feedback
- ✅ List of all available muscle groups
- ✅ Clean, responsive design
- ✅ No dependencies - pure HTML/CSS/JavaScript

## Files

- `index.html` - Main demo page with all functionality
- `Muscles-simplified.svg` - Body diagram SVG
- `README.md` - This file

## Muscle Groups Included

The demo includes 24 clickable muscle groups:
- Chest (upper/middle/lower pecs)
- Back (traps, rhomboids, lats, lower back)
- Shoulders (front/side/rear delts)
- Arms (biceps, triceps, forearms)
- Core (upper/lower abs, obliques)
- Legs (quads, hamstrings, glutes, calves)
- Hip (adductors, abductors)
- Neck

## Customization

Edit `index.html` to customize:
- Colors: Modify the CSS gradient and color scheme
- Muscle names: Update the `muscleMapping` object in JavaScript
- Layout: Adjust the flexbox CSS
- Behavior: Modify the click handlers in JavaScript

## Browser Compatibility

Works in all modern browsers:
- Chrome/Edge
- Firefox
- Safari
- Opera

## License

MIT License - Free to use in your projects!
