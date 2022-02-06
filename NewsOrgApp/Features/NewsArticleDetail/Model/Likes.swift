//
//  Likes.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/6/22.
//

import Foundation

struct Likes: Codable, Identifiable, Equatable {
    
    var id = UUID()
    var likes: Int?
    
    enum CodingKeys: String, CodingKey {
        case likes = "likes"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        likes = try values.decodeIfPresent(Int.self, forKey: .likes) ?? .zero
    }
    
    static func == (lhs: Likes, rhs: Likes) -> Bool {
        lhs.id == rhs.id && lhs.likes == rhs.likes
    }
}
