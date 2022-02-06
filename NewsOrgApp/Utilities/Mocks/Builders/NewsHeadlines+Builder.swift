//
//  NewsHeadlines+Builder.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Foundation

extension NewsHeadlines {
    static func build() -> NewsHeadlines {
        JsonReader.shared.fetchJSONData(fileName: "News", type: NewsHeadlines.self)!
    }
}
