//
//  Comments.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/6/22.
//

import Foundation

struct Comments: Codable, Identifiable, Equatable {
    
    var id = UUID()
    var comments: Int?
    
    enum CodingKeys: String, CodingKey {
        case comments = "comments"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        comments = try values.decodeIfPresent(Int.self, forKey: .comments) ?? .zero
    }
    
    static func == (lhs: Comments, rhs: Comments) -> Bool {
        lhs.id == rhs.id && lhs.comments == rhs.comments
    }
}
