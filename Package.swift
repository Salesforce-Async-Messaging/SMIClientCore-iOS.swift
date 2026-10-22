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
            url: "https://salesforce-async-messaging.s3.amazonaws.com/public/ios/1.13.2/SMIClientCore-Release.xcframework.zip",
            checksum: "ee589f74033de4d5e840115db28948748206dfa7f4df6c6768aa533c7cb522ae"
        ),
        .binaryTarget(
            name: "SMIMultimediaCommon",
            url: "https://salesforce-async-messaging.s3.amazonaws.com/public/ios/1.13.2/SMIMultimediaCommon-Release.xcframework.zip",
            checksum: "c12b526d4c1166137fee323ae12848bd9ad7d4a6471fe0d0090fefcbcd1c7bc5"
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
