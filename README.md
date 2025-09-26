# Daily Wisdom iOS App

A minimal iOS app that displays daily quotes from Merlin Mann's Wisdom Project and sends daily notifications at 7:30 AM.

## How to Build

```sh
# build
xcodebuild -project DailyWisdom.xcodeproj -scheme DailyWisdom -configuration Release -destination 'platform=iOS,id=$DEVICE_ID' build

# install
xcrun devicectl device install app --device 00008110-00063CD91EA1401E ~/Library/Developer/Xcode/DerivedData/DailyWisdom-gtzctsraljcudycjrgkxvsqkpdri/Build/Products/Release-iphoneos/DailyWisdom.app
```

How does one find `$DEVICE_ID`? Use a wrong value and you'll get a list of available devices with
their ids.

## Features

- **Daily notifications** at 7:30 AM with random quotes
- **Quotes from Merlin Mann's wisdom collection** embedded in the app
- **No internet connection required** - all quotes stored locally
