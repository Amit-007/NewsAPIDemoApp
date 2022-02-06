//
//  MockSuccessfulNewsArticleWebService.swift
//  NewsOrgAppTests
//
//  Created by Amit Majumdar on 2/5/22.
//

import XCTest
import Combine
@testable import NewsOrgApp

class MockSuccessfulNewsArticleWebService: NewsArticleWebServiceProtocol {
   
    var baseURL: String = .empty

    func fetchTopHeadlines(pageNumber: Int) -> AnyPublisher<NewsHeadlines, Error> {
        let mockArticles = NewsHeadlines.build()
        return AnyPublisher(Just(mockArticles))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

