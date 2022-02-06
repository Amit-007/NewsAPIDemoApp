//
//  Publisher+Error.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Combine

extension Publisher {
    func extractUnderlyingError() -> Publishers.MapError<Self, Failure> {
        mapError {
            ($0.underlyingError as? Failure) ?? $0
        }
    }
}
