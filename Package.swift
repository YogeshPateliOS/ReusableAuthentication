// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "ReusableAuthentication",
    products: [
        .library(name: "ReusableAuthentication",  targets: ["ReusableAuthentication"])
    ],
    dependencies: [],
    targets: [
        .target(name: "ReusableAuthentication", path: "Resources")
    ]
)
