//
//  MockSuccessfulNewsDetailWebService.swift
//  NewsOrgAppTests
//
//  Created by Amit Majumdar on 2/6/22.
//

import Foundation
import XCTest
import Combine
@testable import NewsOrgApp

class MockSuccessfulNewsDetailWebService: NewsDetailWebServiceProtocol {
   
    var baseURL: String = ""
    
    func fetchLikes(for articleID: String) -> AnyPublisher<Likes, Error> {
        let mockLikes = Likes.build()
        return AnyPublisher(Just(mockLikes))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func fetchComments(for articleID: String) -> AnyPublisher<Comments, Error> {
        let mockComments = Comments.build()
        return AnyPublisher(Just(mockComments))
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
