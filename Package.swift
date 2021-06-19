// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BertNlpDbpediaInterface_swift",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BertNlpDbpediaInterface_swift",
            targets: ["BertNlpDbpediaInterface_swift"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", .branch("master")),
        .package(url: "https://github.com/mark-watson/SparqlQuery_swift.git", .branch("main")),
        .package(url: "https://github.com/mark-watson/NLP_swift.git", .branch("main")),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "1.7.4"),
        ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BertNlpDbpediaInterface_swift",
            dependencies: ["SwiftyJSON", "SparqlQuery_swift", "NLP_swift"],
            resources: [
              .process("Resources/bert-base-uncased-vocab.txt"),
                .process("Resources/BERTQAFP16.mlmodel")
            ]),
        .testTarget(
            name: "BertNlpDbpediaInterface_swiftTests",
            dependencies: ["BertNlpDbpediaInterface_swift", "SwiftyJSON", "SwiftSoup"]),

    ]
)
