//
//  MockFailureNewsDetailWebService.swift
//  NewsOrgAppTests
//
//  Created by Amit Majumdar on 2/6/22.
//

import Foundation
import XCTest
import Combine
@testable import NewsOrgApp

class MockFailureNewsDetailWebService: NewsDetailWebServiceProtocol {
   
    var baseURL: String = "MOCK_URL"
    
    func fetchLikes(for articleID: String) -> AnyPublisher<Likes, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: URL(string: baseURL)!)
            .tryMap { _, _ in
                throw NetworkError.unexpectedResponse
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchComments(for articleID: String) -> AnyPublisher<Comments, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: URL(string: baseURL)!)
            .tryMap { _, _ in
                throw NetworkError.unexpectedResponse
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
