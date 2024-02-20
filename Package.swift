// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "feather-objects",
    platforms: [
       .macOS(.v12),
    ],
    products: [
        .library(name: "FeatherObjects", targets: ["FeatherObjects"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(name: "FeatherObjects", dependencies: []),
        
        .testTarget(name: "FeatherObjectsTests", dependencies: [
            .target(name: "FeatherObjects"),
        ]),
    ]
)

