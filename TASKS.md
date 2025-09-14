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

### ✅ Task 3: Random Quote Selection - COMPLETE
**Status:** Complete ✅
**Description:** Implement truly random quote selection logic to pick daily quotes from the parsed quote collection.

**Completed:**
- ✅ Implemented elegant epoch-based random quote selection algorithm
- ✅ Created `getTodaysQuote()` function with fixed seed shuffling
- ✅ Used September 14, 2025 as epoch date with seed 19800822
- ✅ Proper negative day handling with modulo arithmetic
- ✅ Refactored QuoteManager with functional programming principles
- ✅ Quotes can repeat, same quote appears all day, different quote each day
- ✅ Tested and verified random selection works correctly

### ✅ Task 4: Main App Interface - COMPLETE
**Status:** Complete ✅
**Description:** Replace "Hello World" with today's quote display using minimal UI showing current quote.

**Completed:**
- ✅ Updated ContentView.swift to show actual quotes
- ✅ Replaced debug info with today's selected quote
- ✅ Added professional header "Merlin Mann's Daily Wisdom"
- ✅ Added current date display below header in small grey text
- ✅ Increased quote text size to .title2 for better readability
- ✅ Added italic styling to quotes for emphasis
- ✅ Added right-aligned source attribution link to original GitHub repo
- ✅ Implemented proper visual hierarchy with consistent spacing
- ✅ App builds and runs successfully in simulator
- ✅ Interface is clean, professional, and user-friendly

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
- **Active Task:** Task 5 - Notification System Implementation
- **Last Updated:** Task 4 completed, main app interface with professional styling complete
- **Next Steps:** Implement 7:30 AM daily notifications with quotes

## Development Notes
- Project uses iOS 17.0+ deployment target
- SwiftUI-based interface
- No internet connection required (offline app)
- Quotes embedded as bundle resource
- Standard iOS development workflow
