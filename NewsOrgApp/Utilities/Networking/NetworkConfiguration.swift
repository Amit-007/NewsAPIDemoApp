//
//  NetworkConfiguration.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Foundation

public class NetworkConfiguration {
    
    public static let shared = NetworkConfiguration()
    
    public enum Environment: Equatable {
        
        case production
        case mock(responseProvider: MockResponseProvider)
        
        public static func ==(lhs: NetworkConfiguration.Environment, rhs: NetworkConfiguration.Environment) -> Bool {
            switch (lhs, rhs) {
            case (.mock(_), .production), (production, .mock(_)):
                return false
            default:
                return true
            }
        }
        
        var isMock: Bool {
            self != .production
        }
    }
    
    private var _environment: Environment = .production
    
    private var _mockResponseProvider: MockResponseProvider = DefaultMockResponseProvider()
    
    var currentEnvironment: Environment {
        NetworkConfiguration.shared._environment
    }
    
    var mockResponseProvider: MockResponseProvider {
        NetworkConfiguration.shared._mockResponseProvider
    }
    
    public static func setConfiguration(for environment: Environment) {
        NetworkConfiguration.shared._environment = environment
        setMockResponseProvider(for: environment)
    }

    private static func setMockResponseProvider(for environment: Environment) {
        switch environment {
        case .production:
            break
        case .mock(let mockResponseProvider):
            NetworkConfiguration.shared._mockResponseProvider = mockResponseProvider
        }
    }
}





