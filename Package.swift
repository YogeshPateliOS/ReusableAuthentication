// swift-tools-version:5.1

import PackageDescription

let package = Package(name: "ReusableAuthentication",
                      platforms: [.macOS(.v10_12),
                                  .iOS(.v10),
                                  .tvOS(.v10),
                                  .watchOS(.v3)],
                      products: [.library(name: "ReusableAuthentication",
                                          targets: ["ReusableAuthentication"])],
                      targets: [.target(name: "ReusableAuthentication",
                                        path: "Source")],
                      swiftLanguageVersions: [.v5])
