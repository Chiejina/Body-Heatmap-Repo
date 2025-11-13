// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BodyHeatmap",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "BodyHeatmap",
            targets: ["BodyHeatmap"]),
    ],
    targets: [
        .target(
            name: "BodyHeatmap",
            dependencies: [],
            resources: [
                .process("Resources/Muscles-simplified.svg")
            ]
        )
    ]
)
