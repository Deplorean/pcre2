// swift-tools-version: 6.0.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "pcre2",
    platforms: [
        .macOS(.v15),
        .visionOS(.v2),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "pcre2",
            targets: [
                "pcre2"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Deplorean/bzip2.git", branch: "main"),
        .package(url: "https://github.com/Deplorean/sljit.git", branch: "main"),
        .package(url: "https://github.com/Deplorean/z.git", branch: "main")
    ],
    targets: [
        .testTarget(
            name: "pcre2_tests",
            dependencies: ["pcre2"]
        ),
        .target(
            name: "pcre2",
            dependencies: [
                .product(name: "bz2", package: "bzip2"),
                .product(name: "sljit", package: "sljit"),
                .product(name: "z", package: "z")
            ],
            path: "Sources/pcre2",
            sources: [
                "src/pcre2_auto_possess.c",
                "src/pcre2_chkdint.c",
                "src/pcre2_compile.c",
                "src/pcre2_compile_class.c",
                "src/pcre2_config.c",
                "src/pcre2_context.c",
                "src/pcre2_convert.c",
                "src/pcre2_dfa_match.c",
                "src/pcre2_error.c",
                "src/pcre2_extuni.c",
                "src/pcre2_find_bracket.c",
                "src/pcre2_jit_compile.c",
                "src/pcre2_maketables.c",
                "src/pcre2_match.c",
                "src/pcre2_match_data.c",
                "src/pcre2_newline.c",
                "src/pcre2_ord2utf.c",
                "src/pcre2_pattern_info.c",
                "src/pcre2_script_run.c",
                "src/pcre2_serialize.c",
                "src/pcre2_string_utils.c",
                "src/pcre2_study.c",
                "src/pcre2_substitute.c",
                "src/pcre2_substring.c",
                "src/pcre2_tables.c",
                "src/pcre2_ucd.c",
                "src/pcre2_valid_utf.c",
                "src/pcre2_xclass.c",
                "src/pcre2_chartables.c"
            ],
            cSettings: [
                .define("HAVE_CONFIG_H"),
                .define("PCRE2_CODE_UNIT_WIDTH", to: "32")
            ]
        )
    ]
)
