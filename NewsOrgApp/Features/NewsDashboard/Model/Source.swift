//
//  Source.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Foundation

struct Source: Codable, Equatable {
    
    var id: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
