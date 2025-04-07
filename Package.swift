// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "pcre2",
    platforms: [
        .macOS(.v15),
        .visionOS(.v2),
        .iOS(.v15),
    ],
    products: [
        .library(name: "pcre2",
                 type: .dynamic,
                 targets: ["pcre2"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Deplorean/bzip2.git", from: "1.0.8"),
        .package(url: "https://github.com/Deplorean/z.git", from: "1.3.1")
    ],
    targets: [
        .target(
            name: "pcre2",
            dependencies: [
                .product(name: "bzlib", package: "bzip2"),
                .product(name: "z", package: "z")
            ],
            exclude: [
                
            ],
            sources: [
                // "src",
                //
                "src/config.h",
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
                
                "src/pcre2posix.c",
                
                //"deps/sljit/sljit_src/sljitLir.h",
            ],
            publicHeadersPath: "include",
            cSettings: [
                .define("HAVE_ASSERT_H", to: "true"),
                .define("HAVE_UNISTD_H", to: "true"),
                .define("HAVE_WINDOWS_H", to: "false"),
                
                .define("HAVE_MEMMOVE", to: "true"),
                .define("HAVE_STRERROR", to: "true"),
                //.define("PCRE2_EXPORT", to: "__attribute__ ((visibility (\"default\")))"),
                .define("PCRE2_EXPORT", to: ""),
                .define("PCRE2_LINK_SIZE", to: "2"),
                .define("LINK_SIZE", to: "2"),
                .define("HEAP_LIMIT", to: "20000000"),
                .define("MATCH_LIMIT", to: "10000000"),
                .define("MATCH_LIMIT_DEPTH", to: "MATCH_LIMIT"),
                .define("MAX_VARLOOKBEHIND", to: "255"),
                .define("MAX_NAME_SIZE", to: "255"),
                .define("MAX_NAME_COUNT", to: "255"),
                .define("NEWLINE_DEFAULT", to: "2"),
                .define("PARENS_NEST_LIMIT", to: "250"),
                .define("PCRE2_CODE_UNIT_WIDTH", to: "8"),
                .define("SUPPORT_UNICODE", to: "true"),
                //.define("PCRE2_STATIC", to: "false"),
                .headerSearchPath("include"),
                .headerSearchPath("src"),
                .headerSearchPath("deps"),
                .unsafeFlags([
                    "-D_THREAD_SAFE",
                    "-pthread",
                    "-O2",
                    "-fvisibility=hidden"
                ])
            ],
        ),
    ],
    //cLanguageStandard: .gnu11,
    //cxxLanguageStandard: .gnucxx17
)
