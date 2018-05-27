// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Avatars",
	products: [
		.library(name: "Avatars", targets: ["Avatars"])
	],
	dependencies: [],
	targets: [
	.target(name: "Avatars", dependencies: [], path: "Sources/Shared"),
		.testTarget(name: "AvatarsTests", dependencies: ["Avatars"], path: "AvatarsTests/Shared")
	]
)
