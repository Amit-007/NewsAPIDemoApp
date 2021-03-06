//
//  NetworkError.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Foundation


public typealias HTTPCode = Int
public typealias HTTPCodes = Range<HTTPCode>

public enum NetworkError: Error, CustomNSError {
    
    case apiError(HTTPCode)
    case invalidEndPoint
    case unexpectedResponse
    case noData
    case serializationError
    
    public var localizedDescription: String {
        switch self {
        case .apiError(let code): return "Returned with Error: \(code)."
        case .invalidEndPoint: return "Please check the endpoint"
        case .unexpectedResponse: return "Response is invalid."
        case .noData: return "No Data Found."
        case .serializationError: return "Found issues serializing Data."
        }
    }
    
    public var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}

extension HTTPCodes {
    public static let success = 200..<300
}
