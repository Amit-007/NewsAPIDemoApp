//
//  News+Builder.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Foundation

extension Article {
    static func build() -> Article {
        (JsonReader.shared.fetchJSONData(fileName: "News", type: NewsHeadlines.self)?.articles.last)!
    }
}
