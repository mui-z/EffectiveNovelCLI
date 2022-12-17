// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EffectiveNovel",
    platforms: [.macOS(.v10_15)],
    products: [
        .executable(name: "nov", targets: ["EffectiveNovel"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Rainbow", from: "4.0.1"),
        .package(url: "https://github.com/kylef/PathKit", from: "1.0.0"),
        .package(url: "https://github.com/jakeheis/SwiftCLI", from: "6.0.3"),
        .package(url: "https://github.com/mui-z/effective-novel-core", from: "1.1.2")
    ],
    targets: [
        .executableTarget(name: "EffectiveNovel", dependencies: [
            "EffectiveNovelCLI",
        ]),
		.target(name: "EffecttiveNovelCLI", dependencies: [
            "SwiftCLI",
			"EffectiveNovelKit"
		]),
        .target(name: "EffectiveNovelKit", dependencies: [
            "PathKit",
            "Rainbow",
            "SwiftCLI",
            .product(name: "EffectiveNovelCore", package: "effective-novel-core"),
        ]),
        .testTarget(
            name: "EffectiveNovelCLITests",
            dependencies: ["EffectiveNovelCLI"]
        ),
    ]
)
