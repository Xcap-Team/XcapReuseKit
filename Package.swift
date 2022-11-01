// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XcapReuseKit",
    platforms: [.iOS(.v11), .macOS(.v11)],
    products: [
        .library(name: "XcapReuseKit", targets: ["XcapReuseKit"]),
    ],
    targets: [
        .target(name: "XcapReuseKit"),
        .testTarget(name: "XcapReuseKitTests", dependencies: ["XcapReuseKit"]),
    ]
)
