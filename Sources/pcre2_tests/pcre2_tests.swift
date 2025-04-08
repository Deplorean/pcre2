//
//  File.swift
//  pcre2
//
//  Created by Charles Gardner on 4/7/25.
//

import Testing
import pcre2

struct pcre2_tests {
    @Test("Assert version matches 10.45")
    func testLoadingOfPcre2Library() async throws {
        let version = String(PACKAGE_VERSION)
        
        assert(version == "10.45")
    }
}
