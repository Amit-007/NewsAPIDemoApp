//
//  NewsDashboardViewModelTests.swift
//  NewsOrgAppTests
//
//  Created by Amit Majumdar on 2/5/22.
//

import XCTest
@testable import NewsOrgApp

class NewsDashboardViewModelTests: XCTestCase {

    func testFetchNewsHeadlinesSuccessScenario() {
        let viewModel = NewsDashboardViewModel(webservice: MockSuccessfulNewsArticleWebService())
        viewModel.fetchNewsHeadlines {
            XCTAssertNotNil(viewModel)
            XCTAssertNotNil(viewModel.articles)
            XCTAssertEqual(viewModel.title, "News")
            XCTAssertEqual(viewModel.pageNumber, 1)
            XCTAssertEqual(viewModel.hasErrorOccured.occured, false)
            XCTAssertNil(viewModel.hasErrorOccured.error)
        }
    }
    
    func testFetchNewsHeadlinesFailureScenario() {
        let viewModel = NewsDashboardViewModel(webservice: MockFailureNewsArticleWebService())
        viewModel.fetchNewsHeadlines {
            XCTAssertNotNil(viewModel)
            XCTAssertNil(viewModel.articles)
            XCTAssertEqual(viewModel.title, "News")
            XCTAssertEqual(viewModel.pageNumber, 1)
            XCTAssertEqual(viewModel.hasErrorOccured.occured, true)
            XCTAssertNotNil(viewModel.hasErrorOccured.error)
        }
    }
}


