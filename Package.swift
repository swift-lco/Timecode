// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "Timecode",
    platforms: [
        .macOS(.v26), // current Homebrew libltc bottle
    ],
    products: [
        .library(
            name: "Timecode",
            targets: [
                "Timecode",
            ]
        ),
        .executable(
            name: "timecode",
            targets: [
                "TimecodeCLI",
            ]
        ),
        .library(name: "TimecodeLTCBridge", targets: ["TimecodeLTCBridge"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/leviouwendijk/Media.git",
            branch: "master"
        ),
        .package(
            url: "https://github.com/leviouwendijk/Arguments.git",
            branch: "master"
        ),
        .package(
            url: "https://github.com/leviouwendijk/Terminal.git",
            branch: "master"
        ),
    ],
    targets: [
        .systemLibrary(
            name: "TimecodeCLibLTC",
            pkgConfig: "ltc",
            providers: [
                .brew(
                    [
                        "libltc",
                    ]
                ),
            ]
        ),
        .target(
            name: "TimecodeLTCBridge",
            dependencies: [
                "TimecodeCLibLTC",
            ],
            publicHeadersPath: "include"
        ),
        .target(
            name: "Timecode",
            dependencies: [
                "TimecodeLTCBridge",
                .product(
                    name: "MediaCore",
                    package: "Media"
                ),
                .product(
                    name: "MediaAV",
                    package: "Media"
                ),
            ]
        ),
        .executableTarget(
            name: "TimecodeCLI",
            dependencies: [
                "Timecode",
                .product(
                    name: "MediaCore",
                    package: "Media"
                ),
                .product(
                    name: "MediaAV",
                    package: "Media"
                ),
                .product(
                    name: "MediaPath",
                    package: "Media"
                ),
                .product(
                    name: "Arguments",
                    package: "Arguments"
                ),
                .product(
                    name: "Terminal",
                    package: "Terminal"
                ),
            ]
        ),
    ],
    swiftLanguageModes: [
        .v6,
    ]
)
