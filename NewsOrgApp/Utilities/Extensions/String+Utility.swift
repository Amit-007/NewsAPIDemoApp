//
//  String+Utility.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Foundation

extension String {
    
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isEmptyString: Bool {
        trimmed.isEmpty
    }
    
    var formattedArticleID: String {
        replacingOccurrences(of: "https://", with: "").replacingOccurrences(of: "/", with: "-")
    }
    
    static let empty = ""
    static let pipe = " | "
}
