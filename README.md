# QRReader

A lightweight and efficient iOS framework for QR code scanning using Apple's VisionKit framework. Built with Swift, it provides a customizable scanning interface with real-time detection capabilities.

## Features

- 📱 Native iOS QR code scanning using VisionKit
- 🎨 Fully customizable scanner overlay
- 🎯 Region of Interest (ROI) support for precise scanning
- 💫 Real-time QR code detection
- 🔍 High-accuracy scanning
- ⚡️ High frame rate tracking support
- 🛠 Easy integration with existing projects

## Requirements

- iOS 16.0+
- Swift 5.9+
- Xcode 15.0+

## Installation

### Swift Package Manager

Add QRReader to your project through Swift Package Manager by adding the following to your Package.swift dependencies:

    .package(url: "https://github.com/yourusername/QRReader.git", from: "1.0.0")

### Manual Installation

1. Download the QRReader.xcframework
2. Drag and drop it into your Xcode project
3. Ensure it's embedded and signed in your target's settings

## Usage

### Basic Implementation

1. First, import the framework by adding this line at the top of your file:

```swift
    import QRReader
```

2. Create a QRReader instance and present the scanner:

```swift
    let qrReader = QRReader()

    if qrReader.isScanningAvailable() {
        qrReader.presentScanner(from: viewController) { scannedCode in
            print("Scanned QR Code: \(scannedCode)")
        }
    }
```

### Customization

QRReader provides various customization options:

```swift
    let qrReader = QRReader()

    // Customize appearance
    qrReader.overlayColor = UIColor.black.withAlphaComponent(0.5)
    qrReader.cornerColor = .systemGreen
    qrReader.instructionText = "Align QR code within frame"
    qrReader.padding = 8
    qrReader.windowSize = 250
```
    
### Available Properties

| Property | Type | Description | Default Value |
|----------|------|-------------|---------------|
| `overlayColor` | UIColor | Scanner overlay background color | `black.alpha(0.5)` |
| `cornerColor` | UIColor | Corner markers color | `.systemGreen` |
| `instructionText` | String | Guidance text for users | "Align the QR code within the frame to scan" |
| `padding` | CGFloat | Padding around scanner window | 8 |
| `windowSize` | CGFloat | Size of scanner window | 250 |

## Example Implementation

Here's a complete example of implementing QRReader in a view controller:

```swift
    import UIKit
    import QRReader

    class ScannerViewController: UIViewController {
        
        private let qrReader = QRReader()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupScanner()
        }
        
        private func setupScanner() {
            // Customize appearance
            qrReader.overlayColor = UIColor.black.withAlphaComponent(0.6)
            qrReader.cornerColor = .systemBlue
            qrReader.instructionText = "Place QR Code Here"
            
            // Present scanner
            if qrReader.isScanningAvailable() {
                qrReader.presentScanner(from: self) { [weak self] code in
                    self?.handleScannedCode(code)
                }
            }
        }
        
        private func handleScannedCode(_ code: String) {
            print("Scanned QR Code: \(code)")
        }
    }
``` 

## Privacy Usage Description

Add the following key to your Info.plist:

    <key>NSCameraUsageDescription</key>
    <string>Camera access is required for scanning QR codes</string>

## Features in Detail

- **High Performance Scanning**: Utilizes VisionKit's DataScannerViewController for efficient QR code detection
- **Customizable UI**: Fully customizable overlay, corners, and instruction text
- **Region of Interest**: Focused scanning area for better accuracy
- **Real-time Detection**: Immediate feedback when QR codes are detected
- **Memory Management**: Efficient handling of camera resources

## Demonstration

![ezgif-2-90ecf54ea9](https://github.com/user-attachments/assets/d91ab364-e7f8-4138-bbbf-ed053c6a2e0e)

## License

This project is available under the MIT license. See the LICENSE file for more info.

## Author

[Mert Adem Özseven](https://mertozseven.com)

## Support

For support, please create an issue in the GitHub repository or contact [Mert Adem Özseven](https://mertozseven.com).
