# Daily Wisdom App - Task List

## Project Overview
iOS app that displays daily quotes from Merlin Mann's wisdom collection and sends daily notifications at 7:30 AM.

## Requirements
- Minimal iOS app with SwiftUI
- Quotes from wisdom.md embedded in app source code (no internet needed)
- Daily notification at 7:30 AM with random quote
- Minimal main screen showing today's quote
- Truly random quote selection

## Task Breakdown

### ✅ Task 1: Project Setup and Configuration - COMPLETE
**Status:** Complete ✅  
**Description:** Set up iOS project structure, Xcode configuration, basic SwiftUI app with minimal "Hello World" interface. App builds and runs successfully.

**Completed:**
- Created DailyWisdom.xcodeproj with proper iOS configuration
- Basic SwiftUI app structure (DailyWisdomApp.swift, ContentView.swift)
- Asset catalog structure (Assets.xcassets)
- Downloaded and embedded wisdom.md file (446 lines of quotes)
- Created .gitignore file
- App builds and runs in simulator
- Minimal "Hello World" interface displaying

### ✅ Task 2: Quote Data Management - COMPLETE
**Status:** Complete ✅
**Description:** Parse wisdom.md file at runtime, create QuoteManager class, extract individual quotes from bullet-point format, and verify quote parsing works correctly.

**Completed:**
- Created QuoteManager singleton class with string array storage
- Read wisdom.md from app bundle at runtime using Bundle.main
- Parse bullet-point format quotes (filter lines starting with "- ")
- Extract clean quote text (remove "- " prefix, trim whitespace)
- Create array of quote strings loaded once at startup
- Verified parsing works correctly - app displays quote count and first quote
- App builds and runs successfully with simplified UI

### 🔄 Task 3: Random Quote Selection - NEXT
**Status:** Not Started
**Description:** Implement truly random quote selection logic to pick daily quotes from the parsed quote collection.

**TODO:**
- Implement random quote selection algorithm (truly random)
- Create function to get "today's quote"
- Ensure quotes can repeat (no complex tracking needed)
- Test random selection works correctly

### 📱 Task 4: Main App Interface
**Status:** Not Started
**Description:** Replace "Hello World" with today's quote display using minimal UI showing current quote.

**TODO:**
- Update ContentView.swift to show actual quotes
- Replace "Hello, World!" with today's selected quote
- Add basic styling for quote display
- Show attribution to Merlin Mann
- Keep interface minimal as requested

### 🔔 Task 5: Notification System Implementation
**Status:** Not Started  
**Description:** Implement 7:30 AM daily notifications with actual quotes using UserNotifications framework, and test notification functionality.

**TODO:**
- Add UserNotifications framework import
- Request notification permissions on app launch
- Schedule daily 7:30 AM notifications
- Include actual random quotes in notification content
- Test notification functionality
- Verify notifications work correctly

### 📦 Task 6: App Store Preparation
**Status:** Not Started  
**Description:** Create app icons and final polish for App Store submission.

**TODO:**
- Create app icon (1024x1024 and various sizes)
- Add app icon to Assets.xcassets
- Update app metadata if needed
- Final testing and polish
- Prepare for App Store submission

## Current Status
- **Active Task:** Task 3 - Random Quote Selection
- **Last Updated:** Task 2 completed, QuoteManager working with simplified UI
- **Next Steps:** Implement random quote selection algorithm

## Development Notes
- Project uses iOS 17.0+ deployment target
- SwiftUI-based interface
- No internet connection required (offline app)
- Quotes embedded as bundle resource
- Standard iOS development workflow
