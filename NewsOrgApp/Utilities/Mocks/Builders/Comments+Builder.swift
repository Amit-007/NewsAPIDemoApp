//
//  Comments+Builder.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/6/22.
//

import Foundation

extension Comments {
    static func build() -> Comments {
        JsonReader.shared.fetchJSONData(fileName: "Comments", type: Comments.self)!
    }
}
