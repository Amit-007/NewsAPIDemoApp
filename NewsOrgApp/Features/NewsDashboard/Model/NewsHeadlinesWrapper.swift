//
//  NewsHeadlinesWrapper.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Foundation

struct NewsHeadlinesWrapper: Decodable, Equatable {
    
    let newsHeadlines: NewsHeadlines

    static func == (lhs: NewsHeadlinesWrapper, rhs: NewsHeadlinesWrapper) -> Bool {
        lhs.newsHeadlines == rhs.newsHeadlines
    }
}
