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
            url: "https://salesforce-async-messaging.s3.amazonaws.com/public/ios/1.13.3/SMIClientCore-Release.xcframework.zip",
            checksum: "e7272e79c6a0379cf0d64fb26f270ddee6954970136da9f87598494c9002e453"
        ),
        .binaryTarget(
            name: "SMIMultimediaCommon",
            url: "https://salesforce-async-messaging.s3.amazonaws.com/public/ios/1.13.3/SMIMultimediaCommon-Release.xcframework.zip",
            checksum: "32803c1ca1a5fdab25be51600693d93eeb07eee63f51727f43ec6495ca2be6b5"
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
