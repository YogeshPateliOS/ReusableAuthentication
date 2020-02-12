// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "ReusableAuthentication",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "ReusableAuthentication",  targets: ["ReusableAuthentication"])
    ],
    targets: [
        .target(name: "ReusableAuthentication", path: "Resources")
    ],
    swiftLanguageVersions: [.version("5")]
)
