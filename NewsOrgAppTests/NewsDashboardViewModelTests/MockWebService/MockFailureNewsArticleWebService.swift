//
//  MockFailureNewsArticleWebService.swift
//  NewsOrgAppTests
//
//  Created by Amit Majumdar on 2/6/22.
//

import XCTest
import Combine
@testable import NewsOrgApp

class MockFailureNewsArticleWebService: NewsArticleWebServiceProtocol {
   
    var baseURL: String = "URL"

    func fetchTopHeadlines(pageNumber: Int) -> AnyPublisher<NewsHeadlines, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: URL(string: baseURL)!)
            .tryMap { _, _ in
                throw NetworkError.unexpectedResponse
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
