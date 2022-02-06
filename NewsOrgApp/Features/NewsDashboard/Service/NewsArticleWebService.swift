//
//  NewsArticleWebService.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Foundation
import Combine

struct NewsArticleWebService: NewsArticleWebServiceProtocol {

    var baseURL: String = "https://newsapi.org/v2/"
    
    enum EndPoints {
        case topHeadlines(Int)
    }
   
    public init() { }
    
    func fetchTopHeadlines(pageNumber: Int) -> AnyPublisher<NewsHeadlines, Error> {
        requestAPI(with: EndPoints.topHeadlines(pageNumber))
    }
}


extension NewsArticleWebService.EndPoints: URLRequestBuilder {
   
    var endpoint: String {
        return endPointDetail.path
    }
    
    var httpMethod: String {
        switch self {
        case .topHeadlines(_):
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
        case .topHeadlines(let pageNum):
            return APIEndPoint(path: "top-headlines?country=us&apiKey=454b961a792749049024617cb4e24962&page=\(pageNum)")
        }
    }
    
    var queryParameters: [String : String?]? {
        return nil
    }
}
