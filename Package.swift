// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "Timecode",
    products: [
        .library(
            name: "Timecode",
            targets: ["Timecode"]
        ),
    ],
    targets: [
        .target(
            name: "Timecode"
        ),
    ],
    swiftLanguageModes: [.v6]
)
