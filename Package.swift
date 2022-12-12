// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EffectiveNovelCLI",
    platforms: [.macOS(.v10_15)],
    products: [
        .executable(name: "efnovel", targets: ["EffectiveNovelCLI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Rainbow", from: "4.0.1"),
        .package(url: "https://github.com/kylef/PathKit", from: "1.0.0"),
        .package(url: "https://github.com/jakeheis/SwiftCLI", from: "6.0.3"),
        .package(url: "https://github.com/mui-z/effective-novel-core", from: "1.1.2")
    ],
    targets: [
        .executableTarget(name: "EffectiveNovelCLI", dependencies: [
            "EffectiveNovelCLIKit",
            "SwiftCLI",
            "PathKit",
            "Rainbow",
            .product(name: "EffectiveNovelCore", package: "effective-novel-core"),
        ]),
        .target(name: "EffectiveNovelCLIKit", dependencies: [
            "PathKit",
            "Rainbow",
            "SwiftCLI"
        ]),
        .testTarget(
            name: "EffectiveNovelCLITests",
            dependencies: ["EffectiveNovelCLI"]
        ),
    ]
)