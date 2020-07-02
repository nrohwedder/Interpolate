// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Interpolate",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
                name: "Interpolate",
                targets: ["Interpolate"]),
    ],
    targets: [
        .target(
            name: "Interpolate",
            path: "Interpolate",
            exclude: [
                "Info-tvOS.plist",
                "Info.plist"
            ])
    ]
)
