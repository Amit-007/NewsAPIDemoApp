//
//  Error+Utils.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//
import Foundation

public extension Error {
    /// Underlying Error
    var underlyingError: Error? {
        let nsError = self as NSError
        if nsError.domain == NSURLErrorDomain && nsError.code == -1009 {
            return self
        }
        return nsError.userInfo[NSUnderlyingErrorKey] as? Error
    }
}

