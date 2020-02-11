//
//  Package.swift
//  Reusable_Authentication
//
//  Created by Solulab on 2/11/20.
//  Copyright © 2020 YogeshPatel. All rights reserved.
//

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
