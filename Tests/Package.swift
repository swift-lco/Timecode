// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "TimecodeTests",
    platforms: [
        .macOS(.v26), // current Homebrew libltc bottle
    ],
    products: [
        .executable(
            name: "timecodetest",
            targets: [
                "TimecodeTestFlows",
            ]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/leviouwendijk/Media.git",
            branch: "master"
        ),
        .package(
            url: "https://github.com/leviouwendijk/IO.git",
            branch: "master"
        ),
        .package(
            url: "https://github.com/leviouwendijk/Writers.git",
            branch: "master"
        ),
        .package(
            url: "https://github.com/swift-tooling/TestFlows.git",
            branch: "master"
        ),
        .package(path: ".."),
    ],
    targets: [
        .executableTarget(
            name: "TimecodeTestFlows",
            dependencies: [
                .product(name: "Timecode", package: "Timecode"),
                .product(name: "TimecodeLTCBridge", package: "Timecode"),
                .product(
                    name: "MediaCore",
                    package: "Media"
                ),
                .product(
                    name: "MediaAV",
                    package: "Media"
                ),
                .product(
                    name: "IO",
                    package: "IO"
                ),
                .product(
                    name: "Writers",
                    package: "Writers"
                ),
                .product(
                    name: "TestFlows",
                    package: "TestFlows"
                ),
            ]
        ),
    ],
    swiftLanguageModes: [
        .v6,
    ]
)
