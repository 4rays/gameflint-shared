// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var dependencies: [PackageDescription.Package.Dependency] = []
var targetDependencies: [PackageDescription.Target.Dependency] = []

#if os(Linux)
dependencies.append(
  .package(url: "https://github.com/apple/swift-crypto.git", from: "2.1.0")
)

targetDependencies.append(
  .product(name: "Crypto", package: "swift-crypto")
)
#endif

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
  dependencies: dependencies,
  targets: [
    .target(
      name: "GameFlintShared",
      dependencies: targetDependencies
    ),
    .testTarget(
      name: "GameFlintSharedTests",
      dependencies: ["GameFlintShared"]
    ),
  ]
)
