// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "Cartography",
    // platforms: [.iOS("8.0"), .macOS("10.10"), tvOS("9.0"), .watchOS("2.0")],
    products: [
        .library(name: "Cartography", targets: ["Cartography"])
    ],
    targets: [
        .target(
            name: "Cartography",
            path: "Cartography"
        )
    ]
)
