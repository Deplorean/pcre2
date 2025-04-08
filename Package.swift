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
              .define("HAVE_ASSERT_H", to: "1"),
              /* Define this if your compiler supports __attribute__((uninitialized)) */
              .define("HAVE_ATTRIBUTE_UNINITIALIZED", to: "1"),
              /* Define to 1 if you have the 'bcopy' function. */
              .define("HAVE_BCOPY", to: "1"),
              /* Define this if your compiler provides __assume() */
              /* #undef HAVE_BUILTIN_ASSUME */
              /* Define this if your compiler provides __builtin_mul_overflow() */
              .define("HAVE_BUILTIN_MUL_OVERFLOW", to: "1"),
              /* Define this if your compiler provides __builtin_unreachable() */
              .define("HAVE_BUILTIN_UNREACHABLE", to: "1"),
              /* Define to 1 if you have the <bzlib.h> header file. */
              .define("HAVE_BZLIB_H", to: "1"),
              /* Define to 1 if you have the <dirent.h> header file. */
              .define("HAVE_DIRENT_H", to: "1"),
              /* Define to 1 if you have the <dlfcn.h> header file. */
              .define("HAVE_DLFCN_H", to: "1"),
              /* Define to 1 if you have the <editline/readline.h> header file. */
              /* #undef HAVE_EDITLINE_READLINE_H */
              /* Define to 1 if you have the <edit/readline/readline.h> header file. */
              /* #undef HAVE_EDIT_READLINE_READLINE_H */
              /* Define to 1 if you have the <inttypes.h> header file. */
              .define("HAVE_INTTYPES_H", to: "1"),
              /* Define to 1 if you have the <limits.h> header file. */
              .define("HAVE_LIMITS_H", to: "1"),
              /* Define to 1 if you have the 'memfd_create' function. */
              /* #undef HAVE_MEMFD_CREATE */
              /* Define to 1 if you have the 'memmove' function. */
              .define("HAVE_MEMMOVE", to: "1"),
              /* Define to 1 if you have the <minix/config.h> header file. */
              /* #undef HAVE_MINIX_CONFIG_H */
              /* Define to 1 if you have the 'mkostemp' function. */
              .define("HAVE_MKOSTEMP", to: "1"),
              /* Define if you have POSIX threads libraries and header files. */
              /* #undef HAVE_PTHREAD */
              /* Have PTHREAD_PRIO_INHERIT. */
              /* #undef HAVE_PTHREAD_PRIO_INHERIT */
              /* Define to 1 if you have the <readline.h> header file. */
              /* #undef HAVE_READLINE_H */
              /* Define to 1 if you have the <readline/history.h> header file. */
              /* #undef HAVE_READLINE_HISTORY_H */
              /* Define to 1 if you have the <readline/readline.h> header file. */
              /* #undef HAVE_READLINE_READLINE_H */
              /* Define to 1 if you have the `realpath' function. */
              .define("HAVE_REALPATH", to: "1"),
              /* Define to 1 if you have the 'secure_getenv' function. */
              /* #undef HAVE_SECURE_GETENV */
              /* Define to 1 if you have the <stdint.h> header file. */
              .define("HAVE_STDINT_H", to: "1"),
              /* Define to 1 if you have the <stdio.h> header file. */
              .define("HAVE_STDIO_H", to: "1"),
              /* Define to 1 if you have the <stdlib.h> header file. */
              .define("HAVE_STDLIB_H", to: "1"),
              /* Define to 1 if you have the 'strerror' function. */
              .define("HAVE_STRERROR", to: "1"),
              /* Define to 1 if you have the <strings.h> header file. */
              .define("HAVE_STRINGS_H", to: "1"),
              /* Define to 1 if you have the <string.h> header file. */
              .define("HAVE_STRING_H", to: "1"),
              /* Define to 1 if you have the <sys/stat.h> header file. */
              .define("HAVE_SYS_STAT_H", to: "1"),
              /* Define to 1 if you have the <sys/types.h> header file. */
              .define("HAVE_SYS_TYPES_H", to: "1"),
              /* Define to 1 if you have the <sys/wait.h> header file. */
              .define("HAVE_SYS_WAIT_H", to: "1"),
              /* Define to 1 if you have the <unistd.h> header file. */
              .define("HAVE_UNISTD_H", to: "1"),
              /* Define to 1 if the compiler supports GCC compatible visibility
                 declarations. */
              .define("HAVE_VISIBILITY", to: "1"),
              /* Define to 1 if you have the <wchar.h> header file. */
              .define("HAVE_WCHAR_H", to: "1"),
              /* Define to 1 if you have the <windows.h> header file. */
              /* #undef HAVE_WINDOWS_H */
              /* Define to 1 if you have the <zlib.h> header file. */
              .define("HAVE_ZLIB_H", to: "1"),
              /* This limits the amount of memory that may be used while matching a pattern.
                 It applies to both pcre2_match() and pcre2_dfa_match(). It does not apply
                 to JIT matching. The value is in kibibytes (units of 1024 bytes). */
              .define("HEAP_LIMIT", to: "20000000"),
              /* The value of LINK_SIZE determines the number of bytes used to store links
                 as offsets within the compiled regex. The default is 2, which allows for
                 compiled patterns up to 65535 code units long. This covers the vast
                 majority of cases. However, PCRE2 can also be compiled to use 3 or 4 bytes
                 instead. This allows for longer patterns in extreme cases. */
              .define("LINK_SIZE", to: "2"),
              /* Define to the sub-directory where libtool stores uninstalled libraries. */
              //.define("LT_OBJDIR".libs/"
              /* The value of MATCH_LIMIT determines the default number of times the
                 pcre2_match() function can record a backtrack position during a single
                 matching attempt. The value is also used to limit a loop counter in
                 pcre2_dfa_match(). There is a runtime interface for setting a different
                 limit. The limit exists in order to catch runaway regular expressions that
                 take forever to determine that they do not match. The default is set very
                 large so that it does not accidentally catch legitimate cases. */
              .define("MATCH_LIMIT", to: "10000000"),
              /* The above limit applies to all backtracks, whether or not they are nested.
                 In some environments it is desirable to limit the nesting of backtracking
                 (that is, the depth of tree that is searched) more strictly, in order to
                 restrict the maximum amount of heap memory that is used. The value of
                 MATCH_LIMIT_DEPTH provides this facility. To have any useful effect, it
                 must be less than the value of MATCH_LIMIT. The default is to use the same
                 value as MATCH_LIMIT. There is a runtime method for setting a different
                 limit. In the case of pcre2_dfa_match(), this limit controls the depth of
                 the internal nested function calls that are used for pattern recursions,
                 lookarounds, and atomic groups. */
              .define("MATCH_LIMIT_DEPTH", to: "MATCH_LIMIT"),
              /* This limit is parameterized just in case anybody ever wants to change it.
                 Care must be taken if it is increased, because it guards against integer
                 overflow caused by enormously large patterns. */
              .define("MAX_NAME_COUNT", to: "10000"),
              /* This limit is parameterized just in case anybody ever wants to change it.
                 Care must be taken if it is increased, because it guards against integer
                 overflow caused by enormously large patterns. */
              .define("MAX_NAME_SIZE", to: "128"),
              /* The value of MAX_VARLOOKBEHIND specifies the default maximum length, in
                 characters, for a variable-length lookbehind assertion. */
              .define("MAX_VARLOOKBEHIND", to: "255"),
              /* Defining NEVER_BACKSLASH_C locks out the use of \C in all patterns. */
              /* #undef NEVER_BACKSLASH_C */
              /* The value of NEWLINE_DEFAULT determines the default newline character
                 sequence. PCRE2 client programs can override this by selecting other values
                 at run time. The valid values are 1 (CR), 2 (LF), 3 (CRLF), 4 (ANY), 5
                 (ANYCRLF), and 6 (NUL). */
              .define("NEWLINE_DEFAULT", to: "4"),
              /* Name of package */
              .define("PACKAGE", to: "pcre2"),
              /* Define to the address where bug reports for this package should be sent. */
              .define("PACKAGE_BUGREPORT"),
              /* Define to the full name of this package. */
              .define("PACKAGE_NAME", to: "PCRE2"),
              /* Define to the full name and version of this package. */
              .define("PACKAGE_STRING", to: "PCRE2 10.45"),
              /* Define to the one symbol short name of this package. */
              .define("PACKAGE_TARNAME", to: "pcre2"),
              /* Define to the home page for this package. */
              .define("PACKAGE_URL"),
              /* Define to the version of this package. */
              .define("PACKAGE_VERSION", to: "10.45"),
              /* The value of PARENS_NEST_LIMIT specifies the maximum depth of nested
                 parentheses (of any kind) in a pattern. This limits the amount of system
                 stack that is used while compiling a pattern. */
              .define("PARENS_NEST_LIMIT", to: "250"),
              /* The value of PCRE2GREP_BUFSIZE is the starting size of the buffer used by
                 pcre2grep to hold parts of the file it is searching. The buffer will be
                 expanded up to PCRE2GREP_MAX_BUFSIZE if necessary, for files containing
                 very long lines. The actual amount of memory used by pcre2grep is three
                 times this number, because it allows for the buffering of "before" and
                 "after" lines. */
              .define("PCRE2GREP_BUFSIZE", to: "20480"),
              /* The value of PCRE2GREP_MAX_BUFSIZE specifies the maximum size of the buffer
                 used by pcre2grep to hold parts of the file it is searching. The actual
                 amount of memory used by pcre2grep is three times this number, because it
                 allows for the buffering of "before" and "after" lines. */
              .define("PCRE2GREP_MAX_BUFSIZE", to: "1048576"),
              /* Define to any value to include debugging code. */
              /* #undef PCRE2_DEBUG */
              /* to make a symbol visible */
              .define("PCRE2_EXPORT", to: "__attribute__ ((visibility (\"default\")))"),
              /* If you are compiling for a system other than a Unix-like system or
                 Win32, and it needs some magic to be inserted before the definition
                 of a function that is exported by the library, define this macro to
                 contain the relevant magic. If you do not define this macro, a suitable
                 __declspec value is used for Windows systems; in other environments
                 a compiler relevant "extern" is used with any "visibility" related
                 attributes from PCRE2_EXPORT included.
                 This macro apears at the start of every exported function that is part
                 of the external API. It does not appear on functions that are "external"
                 in the C sense, but which are internal to the library. */
              /* #undef PCRE2_EXP_DEFN */
              /* Define to any value if linking statically (TODO: make nice with Libtool) */
              /* #undef PCRE2_STATIC */
              /* Define to necessary symbol if this constant uses a non-standard name on
                 your system. */
              /* #undef PTHREAD_CREATE_JOINABLE */
              /* Define to any non-zero number to enable support for SELinux compatible
                 executable memory allocator in JIT. Note that this will have no effect
                 unless SUPPORT_JIT is also defined. */
              /* #undef SLJIT_PROT_EXECUTABLE_ALLOCATOR */
              /* Define to 1 if all of the C89 standard headers exist (not just the ones
                 required in a freestanding environment). This macro is provided for
                 backward compatibility; new code need not use it. */
              .define("STDC_HEADERS", to: "1"),
              /* Define to any value to enable differential fuzzing support. */
              /* #undef SUPPORT_DIFF_FUZZ */
              /* Define to any value to enable support for Just-In-Time compiling. */
              /* #undef SUPPORT_JIT */
              /* Define to any value to allow pcre2grep to be linked with libbz2, so that it
                 is able to handle .bz2 files. */
              .define("SUPPORT_LIBBZ2"),
              /* Define to any value to allow pcre2test to be linked with libedit. */
              /* #undef SUPPORT_LIBEDIT */
              /* Define to any value to allow pcre2test to be linked with libreadline. */
              /* #undef SUPPORT_LIBREADLINE */
              /* Define to any value to allow pcre2grep to be linked with libz, so that it
                 is able to handle .gz files. */
              .define("SUPPORT_LIBZ"),
              /* Define to any value to enable callout script support in pcre2grep. */
              .define("SUPPORT_PCRE2GREP_CALLOUT"),
              /* Define to any value to enable fork support in pcre2grep callout scripts.
                 This will have no effect unless SUPPORT_PCRE2GREP_CALLOUT is also defined. */
              .define("SUPPORT_PCRE2GREP_CALLOUT_FORK"),
              /* Define to any value to enable JIT support in pcre2grep. Note that this will
                 have no effect unless SUPPORT_JIT is also defined. */
              /* #undef SUPPORT_PCRE2GREP_JIT */
              /* Define to any value to enable the 16 bit PCRE2 library. */
              /* #undef SUPPORT_PCRE2_16 */
              //.define("SUPPORT_PCRE2_16"),
              /* Define to any value to enable the 32 bit PCRE2 library. */
              .define("SUPPORT_PCRE2_32"),
              /* Define to any value to enable the 8 bit PCRE2 library. */
              /* #undef SUPPORT_PCRE2_8 */
              /* Define to any value to enable support for Unicode and UTF encoding. This
                 will work even in an EBCDIC environment, but it is incompatible with the
                 EBCDIC macro. That is, PCRE2 can support *either* EBCDIC code *or*
                 ASCII/Unicode, but not both at once. */
              //.define("SUPPORT_UNICODE"),
              .define("PCRE2_CODE_UNIT_WIDTH", to: "32")
            ]
        )
    ]
)
