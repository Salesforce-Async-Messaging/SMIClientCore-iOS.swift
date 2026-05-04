// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "SMIClientCore",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SMIClientCore",
            targets: ["SMIClientCore", "SMIMultimediaCommon", "SMIClientCoreWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/sqlcipher/SQLCipher.swift.git", from: "4.10.0")
    ],
    targets: [
        .binaryTarget(
            name: "SMIClientCore",
            url: "https://salesforce-async-messaging.s3.amazonaws.com/public/ios/1.11.1/SMIClientCore-Release.xcframework.zip",
            checksum: "fdeb80393ae0cf2f4272c413ef5b9b6cf1e72aefc7afcac4798c1e197dd3fe04"
        ),
        .binaryTarget(
            name: "SMIMultimediaCommon",
            url: "https://salesforce-async-messaging.s3.amazonaws.com/public/ios/1.11.1/SMIMultimediaCommon-Release.xcframework.zip",
            checksum: "163c1c5a77c4f9167c10830be8f475ccd785a2ee8fd30d21e44e047cc5f3a96f"
        ),
        .target(
            name: "SMIClientCoreWrapper",
            dependencies: [
                "SMIClientCore",
                .product(name: "SQLCipher", package: "SQLCipher.swift")
            ],
            cSettings: [
                .define("SQLITE_HAS_CODEC", to: nil)
            ]
        )
    ]
)
