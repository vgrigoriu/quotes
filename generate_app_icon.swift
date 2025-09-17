#!/usr/bin/env swift

import Foundation
import AppKit
import CoreGraphics

// App Icon Generator for Daily Wisdom
// This script generates all required app icon sizes
// Usage: swift generate_app_icon.swift

func createAppIcon(size: CGSize) -> NSBitmapImageRep? {
    // Create a bitmap representation with exact pixel dimensions
    guard let bitmapRep = NSBitmapImageRep(
        bitmapDataPlanes: nil,
        pixelsWide: Int(size.width),
        pixelsHigh: Int(size.height),
        bitsPerSample: 8,
        samplesPerPixel: 4,
        hasAlpha: true,
        isPlanar: false,
        colorSpaceName: .deviceRGB,
        bytesPerRow: 0,
        bitsPerPixel: 0
    ) else { return nil }

    // Create graphics context
    let context = NSGraphicsContext(bitmapImageRep: bitmapRep)
    NSGraphicsContext.saveGraphicsState()
    NSGraphicsContext.current = context
    
    // Create gradient background
    let gradient = NSGradient(colors: [
        NSColor(red: 1.0, green: 0.4, blue: 0.0, alpha: 1.0),  // Deep vibrant orange
        NSColor(red: 1.0, green: 0.6, blue: 0.1, alpha: 1.0)   // Lighter vibrant orange
    ])
    
    let rect = NSRect(origin: .zero, size: size)
    gradient?.draw(in: rect, angle: 135) // Diagonal gradient
    
    // Add quote symbol
    let symbolSize = size.width * 0.85
    let symbolRect = NSRect(
        x: (size.width - symbolSize) / 2,
        y: (size.height - symbolSize) / 2,
        width: symbolSize,
        height: symbolSize
    )
    
    // Draw quote bubble using SF Symbol
    if let symbolImage = NSImage(systemSymbolName: "quote.bubble.fill", accessibilityDescription: nil) {
        symbolImage.isTemplate = true
        
        // Set white color
        NSColor.white.set()
        
        // Draw with shadow
        let shadow = NSShadow()
        shadow.shadowColor = NSColor.black.withAlphaComponent(0.3)
        shadow.shadowOffset = NSSize(width: 0, height: -size.height * 0.01)
        shadow.shadowBlurRadius = size.width * 0.02
        shadow.set()
        
        symbolImage.draw(in: symbolRect)
    } else {
        // Fallback: draw quotation marks manually
        let font = NSFont.systemFont(ofSize: symbolSize * 0.8, weight: .medium)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: NSColor.white
        ]
        
        let quoteText = "\""
        let textSize = quoteText.size(withAttributes: attributes)
        let textRect = NSRect(
            x: (size.width - textSize.width) / 2,
            y: (size.height - textSize.height) / 2,
            width: textSize.width,
            height: textSize.height
        )
        
        quoteText.draw(in: textRect, withAttributes: attributes)
    }
    
    NSGraphicsContext.restoreGraphicsState()
    return bitmapRep
}

func saveIcon(_ bitmapRep: NSBitmapImageRep, to url: URL) -> Bool {
    guard let pngData = bitmapRep.representation(using: .png, properties: [:]) else {
        return false
    }
    
    do {
        try pngData.write(to: url)
        return true
    } catch {
        print("Error saving \(url.lastPathComponent): \(error)")
        return false
    }
}

// Icon sizes required for iOS apps - exact pixel dimensions needed
let iconSizes: [(name: String, size: CGSize)] = [
    ("icon-1024", CGSize(width: 1024, height: 1024)),  // App Store
    ("icon-180", CGSize(width: 180, height: 180)),      // iPhone app 60pt @3x
    ("icon-120", CGSize(width: 120, height: 120))       // iPhone app 60pt @2x
]

// Create output directory
let outputDir = URL(fileURLWithPath: "build/DailyWisdom_AppIcons")
do {
    try FileManager.default.createDirectory(at: outputDir, withIntermediateDirectories: true)
} catch {
    print("Error creating output directory: \(error)")
    exit(1)
}

print("🎨 Generating Daily Wisdom App Icons...")
print("📁 Output directory: \(outputDir.path)")

var successCount = 0
for (name, size) in iconSizes {
    print("📱 Generating \(name).png (\(Int(size.width))x\(Int(size.height)))")
    
    if let icon = createAppIcon(size: size) {
        let fileURL = outputDir.appendingPathComponent("\(name).png")
        if saveIcon(icon, to: fileURL) {
            successCount += 1
        }
    }
}

print("\n✅ Successfully generated \(successCount)/\(iconSizes.count) icons")
print("📂 Icons saved to: \(outputDir.path)")
print("\n🔧 Next steps:")
print("1. Open Xcode project: DailyWisdom.xcodeproj")
print("2. Select Assets.xcassets → AppIcon")
print("3. Drag and drop the generated PNG files to the appropriate slots")
print("4. Build and run to see your new app icon!")

print("\n🎨 Design customization:")
print("- Edit gradient colors in lines 15-16")
print("- Change symbol size in line 41 (currently 0.85 = 85% of icon size)")
print("- Modify SF Symbol in line 32 (currently 'quote.bubble.fill')")
print("- Adjust shadow properties in lines 39-42")
