// swift-tools-version:5.10
import PackageDescription

var dependencies: [PackageDescription.Package.Dependency] = []

var targetDependencies: [PackageDescription.Target.Dependency] = []

#if os(Linux)
  dependencies.append(
    .package(url: "https://github.com/apple/swift-crypto.git", from: "3.1.0")
  )

  targetDependencies.append(
    .product(name: "Crypto", package: "swift-crypto")
  )
#endif

let package = Package(
  name: "gameflint-shared",
  platforms: [
    .iOS(.v16),
    .macOS(.v13),
    .tvOS(.v16),
    .watchOS(.v9),
  ],
  products: [
    .library(
      name: "GameflintShared",
      targets: ["GameflintShared"]
    )
  ],
  dependencies: dependencies,
  targets: [
    .target(
      name: "GameflintShared",
      dependencies: targetDependencies
    ),
    .testTarget(
      name: "GameflintSharedTests",
      dependencies: ["GameflintShared"]
    ),
  ]
)
