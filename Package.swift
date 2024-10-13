// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "LLamaSwift",
    platforms: [
        .macOS(.v12), 
        .iOS(.v12), 
        .watchOS(.v10), 
        .tvOS(.v17), 
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "LLamaSwift",
            targets: ["LLamaSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ggerganov/llama.cpp", branch: "master"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.1"),
    ],
    targets: [
        .target(
            name: "LLamaSwift",        
            dependencies: [
                .product(name: "llama", package: "llama.cpp"),
                .product(name: "Logging", package: "swift-log"),
            ]
        ),
        .testTarget(
            name: "llama-cpp-swiftTests",
            dependencies: ["LLamaSwift"]
        ),
    ]
)
