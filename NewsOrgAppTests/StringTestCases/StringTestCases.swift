//
//  StringTestCases.swift
//  NewsOrgAppTests
//
//  Created by Amit Majumdar on 2/6/22.
//

import XCTest
@testable import NewsOrgApp

class StringTestCases: XCTestCase {
    
    func testTrimmed() {
        XCTAssertEqual(" A big day ".trimmed, "A big day")
        XCTAssertEqual("A big day".trimmed, "A big day")
    }
    
    func testIsStringEmpty() {
        XCTAssertEqual(" A big day ".isEmptyString, false)
        XCTAssertEqual("          ".isEmptyString, true)
    }
    
    func testFormattedArticleID() {
        XCTAssertEqual("https://www.theverge.com/2020/7/21/21332300/nikon-z5-full-frame-mirrorless-camera-price-release-date-specs/index.html".formattedArticleID, "www.theverge.com-2020-7-21-21332300-nikon-z5-full-frame-mirrorless-camera-price-release-date-specs-index.html")
        XCTAssertNotEqual("https://www.theverge.com/2020/7/21/21332300/nikon-z5-full-frame-mirrorless-camera-price-release-date-specs/index.html".formattedArticleID, "https://www.theverge.com/2020/7/21/21332300/nikon-z5-full-frame-mirrorless-camera-price-release-date-specs/index.html")
    }
}
