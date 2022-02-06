//
//  MockResponseProvider.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Foundation

public protocol MockResponseProvider {
    func getMockJsonFile(for fileName: String) -> String
}


struct DefaultMockResponseProvider: MockResponseProvider {
    func getMockJsonFile(for fileName: String) -> String {
        return ""
    }
}
