// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "feather-api",
    platforms: [
       .macOS(.v10_15),
    ],
    products: [
        .library(name: "FeatherApi", targets: ["FeatherApi"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(name: "FeatherApi", dependencies: []),
        
        .testTarget(name: "FeatherApiTests", dependencies: [
            .target(name: "FeatherApi"),
        ]),
    ]
)

