//
//  NewsDetailWebService.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/6/22.
//

import Foundation
import Combine

struct NewsDetailWebService: NewsDetailWebServiceProtocol {
    
    var baseURL: String = "https://cn-news-info-api.herokuapp.com/"

    enum EndPoints {
        case likes(String)
        case comments(String)
    }
    
    func fetchLikes(for articleID: String) -> AnyPublisher<Likes, Error> {
        requestAPI(with: EndPoints.likes(articleID))
    }
    
    func fetchComments(for articleID: String) -> AnyPublisher<Comments, Error> {
        requestAPI(with: EndPoints.comments(articleID))
    }
}

extension NewsDetailWebService.EndPoints: URLRequestBuilder {
   
    var endpoint: String {
        return endPointDetail.path
    }
    
    var httpMethod: String {
        switch self {
        case .comments(_), .likes(_):
            return "GET"
        }
    }
    
    var allHTTPHeaderFields: [String : String]? {
        return nil
    }
    
    func httpBody() throws -> Data? {
        return nil
    }
    
    var endPointDetail: APIEndPoint {
        switch self {
        case .comments(let articleID):
            return APIEndPoint(path: "comments/\(articleID)")
        case .likes(let articleID):
            return APIEndPoint(path: "likes/\(articleID)")
        }
    }
    
    var queryParameters: [String : String?]? {
        return nil
    }
}
