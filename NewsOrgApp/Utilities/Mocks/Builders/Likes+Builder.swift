//
//  Likes+Builder.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/6/22.
//

import Foundation

extension Likes {
    static func build() -> Likes {
        JsonReader.shared.fetchJSONData(fileName: "Likes", type: Likes.self)!
    }
}
