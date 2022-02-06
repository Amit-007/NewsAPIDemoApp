//
//  NewsDetailWebServiceProtocol.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/6/22.
//

import Foundation
import Combine

protocol NewsDetailWebServiceProtocol: WebServiceProtocol {
    
    func fetchLikes(for articleID: String) -> AnyPublisher<Likes, Error>
    func fetchComments(for articleID: String) -> AnyPublisher<Comments, Error>
}
