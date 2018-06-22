// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Avatars",
	products: [
		.library(name: "Avatars", targets: ["Avatars"])
	],
	dependencies: [.package(url: "https://github.com/Appsaurus/SwiftTestUtils",  .upToNextMajor(from: "1.0.0"))],
	targets: [
		.target(name: "Avatars", dependencies: [], path: "Sources/Shared"),
		.testTarget(name: "AvatarsTests", dependencies: ["Avatars", "SwiftTestUtils"], path: "AvatarsTests/Shared")
	]
)
