// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdditionalSwift",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AdditionalSwift",
            targets: ["AdditionalSwift"]),
        .library(
            name: "AdditionalTesting",
            targets: ["AdditionalTesting"]),
    ],
    dependencies: [],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AdditionalSwift",
            dependencies: []),
        .target(
            name: "AdditionalTesting",
            dependencies: []),
        .testTarget(
            name: "AdditionalSwiftTests",
            dependencies: ["AdditionalSwift", "AdditionalTesting"]),
    ]
)
