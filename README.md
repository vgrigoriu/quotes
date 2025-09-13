# Daily Wisdom iOS App

A minimal iOS app that displays daily quotes from Merlin Mann's Wisdom Project and sends daily notifications at 7:30 AM.

## Features

- **Daily notifications** at 7:30 AM with random quotes
- **Minimal interface** showing today's quote
- **Quotes from Merlin Mann's wisdom collection** embedded in the app
- **No internet connection required** - all quotes stored locally
- **SwiftUI-based** modern iOS interface

## Requirements

- iOS 17.0+
- Xcode 16.0+
- Swift 5.0+

## Project Structure

```
DailyWisdom/
├── DailyWisdom.xcodeproj/       # Xcode project file
├── DailyWisdom/
│   ├── DailyWisdomApp.swift     # Main app entry point with notification setup
│   ├── ContentView.swift        # Main UI showing today's quote
│   ├── wisdom.md                # Embedded quotes from Merlin Mann (561 lines)
│   └── Assets.xcassets/         # App icons and assets
└── README.md                    # This file
```

## Development Status

- [x] **Project Setup** - Xcode project structure and basic SwiftUI app ✅
- [ ] Quote parsing from markdown
- [ ] Random quote selection logic
- [ ] Notification system with actual quotes
- [ ] Testing and refinement

## Current Functionality

### ✅ Completed Features:
- **Project builds successfully** with xcodebuild
- **SwiftUI interface** with minimal quote display
- **Notification permissions** requested on app launch
- **Daily notification scheduling** for 7:30 AM (currently with placeholder message)
- **Wisdom.md file embedded** as app resource (400+ quotes ready for parsing)
- **iOS 17+ deployment target** with modern Swift features

### 🔄 Next Steps:
1. **Quote Data Management** - Parse wisdom.md and extract individual quotes
2. **Random Quote Selection** - Implement logic to select and display random quotes
3. **Enhanced Notifications** - Include actual quotes in daily notifications
4. **Testing & Polish** - Ensure reliability and user experience

## Usage

1. **Open the project** in Xcode:
   ```bash
   open DailyWisdom.xcodeproj
   ```

2. **Build and run** on iOS device or simulator
   - Select your target device/simulator
   - Press Cmd+R or click the Run button

3. **Grant notification permissions** when prompted

4. **The app will:**
   - Show today's quote on the main screen
   - Schedule daily 7:30 AM notifications
   - Work completely offline

## Build Verification

The project has been tested and builds successfully:
```bash
xcodebuild -project DailyWisdom.xcodeproj -target DailyWisdom -sdk iphonesimulator build
# ✅ BUILD SUCCEEDED
```

## Credits

- **Quotes**: [Merlin Mann's Wisdom Project](http://wisdom.limo)
- **Framework**: SwiftUI for iOS
- **Notifications**: UserNotifications framework

## License

This project is for educational purposes. Quotes are from Merlin Mann's public wisdom collection.
