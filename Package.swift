// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "QRReader",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "QRReader",
            targets: ["QRReader"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "QRReader",
            path: "build/QRReader.xcframework"
        )
    ]
)