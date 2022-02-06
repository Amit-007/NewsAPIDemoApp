//
//  NewsAPIStore.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/6/22.
//

import Foundation

final class NewsAPIStore: NSObject {
    
    private override init() {
        
    }
    
    static let shared = NewsAPIStore()
    
    var apiKey: String = ""
}
