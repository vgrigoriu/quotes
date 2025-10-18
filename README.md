# Daily Wisdom iOS App

A minimal iOS app that displays daily quotes from Merlin Mann's Wisdom Project and sends daily notifications at 7:30 AM.

## How to Build

```sh
# To find the right device id, run `xcodebuild` with a wrong value. It will
# print a list of available devices.
export DEVICE_ID="00008110-00063CD91EA1401E"

# build
xcodebuild -project DailyWisdom.xcodeproj -scheme DailyWisdom -configuration Release -destination "platform=iOS,id=$DEVICE_ID" -allowProvisioningUpdates build

# install
xcrun devicectl device install app --device $DEVICE_ID ~/Library/Developer/Xcode/DerivedData/DailyWisdom-gtzctsraljcudycjrgkxvsqkpdri/Build/Products/Release-iphoneos/DailyWisdom.app
```

## Features

- **Daily notifications** at 7:30 AM with random quotes
- **Quotes from Merlin Mann's wisdom collection** embedded in the app
- **No internet connection required** - all quotes stored locally
