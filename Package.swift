// swift-tools-version:5.10
import PackageDescription

var dependencies: [PackageDescription.Package.Dependency] = [
  .package(url: "https://github.com/4rays/http-request-builder", from: "1.0.2")
]

var targetDependencies: [PackageDescription.Target.Dependency] = [
  .product(name: "HTTPRequestBuilder", package: "http-request-builder")
]

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
    .iOS(.v15),
    .macOS(.v12),
    .tvOS(.v15),
    .watchOS(.v8),
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
