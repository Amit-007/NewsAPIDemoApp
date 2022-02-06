//
//  NewsArticleDetailViewModelTests.swift
//  NewsOrgAppTests
//
//  Created by Amit Majumdar on 2/6/22.
//

import XCTest
@testable import NewsOrgApp

class NewsArticleDetailViewModelTests: XCTestCase {

    let articleID = "https://cn-news-info-api.herokuapp.com/likes/nypost.com-2022-02-06-knicks-blow-big-lead-in-ot-loss-to-lakers-"
    
    func testFetchNewsArticleCommentsAndLikesSuccessScenario() {
        let viewModel = NewsArticleDetailViewModel(articleID: articleID,
                                                   webservice: MockSuccessfulNewsDetailWebService())
        viewModel.fetchNewsArticleCommentsAndLikes {
            XCTAssertNotNil(viewModel)
            XCTAssertNotNil(viewModel.likes)
            XCTAssertNotNil(viewModel.comments)
            XCTAssertEqual(viewModel.title, "News Detail")
            XCTAssertEqual(viewModel.articleID, self.articleID)
            XCTAssertEqual(viewModel.hasErrorOccured.occured, false)
            XCTAssertNil(viewModel.hasErrorOccured.error)
        }
    }
    
    func testFetchNewsArticleCommentsAndLikesFailureScenario() {
        let viewModel = NewsArticleDetailViewModel(articleID: articleID,
                                                   webservice: MockFailureNewsDetailWebService())
        viewModel.fetchNewsArticleCommentsAndLikes {
            XCTAssertNotNil(viewModel)
            XCTAssertNil(viewModel.likes)
            XCTAssertNil(viewModel.comments)
            XCTAssertEqual(viewModel.title, "News Detail")
            XCTAssertEqual(viewModel.articleID, self.articleID)
            XCTAssertEqual(viewModel.hasErrorOccured.occured, true)
            XCTAssertNotNil(viewModel.hasErrorOccured.error)
        }
    }
}
