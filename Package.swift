// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CCSwiftConveniences",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "CCSwiftConveniences",
            targets: ["CCSwiftConveniences"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CCSwiftConveniences",
            dependencies: []),
        .testTarget(
            name: "CCSwiftConveniencesTests",
            dependencies: ["CCSwiftConveniences"]),
    ]
)
