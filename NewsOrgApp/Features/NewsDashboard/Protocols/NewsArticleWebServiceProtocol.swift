//
//  NewsArticleWebServiceProtocol.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Foundation
import Combine

protocol NewsArticleWebServiceProtocol: WebServiceProtocol {
    
    func fetchTopHeadlines(pageNumber: Int) -> AnyPublisher<NewsHeadlines, Error>
}
