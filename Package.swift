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
        .package(url: "https://github.com/jakeheis/SwiftCLI", from: "6.0.3"),
        .package(url: "https://github.com/mxcl/Path.swift", from: "1.4.0"),
        .package(url: "https://github.com/mui-z/effective-novel-core", from: "1.1.2")
    ],
    targets: [
        .executableTarget(name: "EffectiveNovel", dependencies: [
            "EffectiveNovelCLI",
        ]),
		.target(name: "EffectiveNovelCLI", dependencies: [
            "SwiftCLI",
            "Rainbow",
			"EffectiveNovelKit"
		]),
        .target(name: "EffectiveNovelKit", dependencies: [
			.product(name: "Path", package: "Path.swift"),
            "Rainbow",
            "SwiftCLI",
            .product(name: "EffectiveNovelCore", package: "effective-novel-core"),
        ]),
        .testTarget(
            name: "EffectiveNovelKitTests",
            dependencies: ["EffectiveNovelKit"]
        ),
    ]
)
