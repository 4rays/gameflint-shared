// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "gameflint-shared",
  platforms: [
    .macOS(.v10_15)
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
