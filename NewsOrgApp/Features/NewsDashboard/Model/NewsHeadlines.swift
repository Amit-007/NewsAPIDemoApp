//
//  NewsHeadlines.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Foundation

struct NewsHeadlines : Codable, Equatable {
    
    let status : String
    let totalResults : Int
    let articles : [Article]
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case totalResults = "totalResults"
        case articles = "articles"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        articles = try values.decode([Article].self, forKey: .articles)
        status = try values.decode(String.self, forKey: .status)
        totalResults = try values.decode(Int.self, forKey: .totalResults)
    }
    
    static func == (lhs: NewsHeadlines, rhs: NewsHeadlines) -> Bool {
        lhs.articles == rhs.articles
    }
    
}
