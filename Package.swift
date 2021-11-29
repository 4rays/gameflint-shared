// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "gameflint-shared",
  platforms: [
    .iOS(.v15),
    .macOS(.v12),
    .tvOS(.v15),
    .watchOS(.v8)
  ],
  products: [
    .library(
      name: "GameFlintShared",
      targets: ["GameFlintShared"]
    ),
  ],
  targets: [
    .target(
      name: "GameFlintShared",
      dependencies: []
    ),
    .testTarget(
      name: "GameFlintSharedTests",
      dependencies: ["GameFlintShared"]
    ),
  ]
)
