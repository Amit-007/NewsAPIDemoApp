//
//  Publisher+Decodable.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Combine
import Foundation

public extension Publisher where Output == URLSession.DataTaskPublisher.Output {
    
    func decodeResponse<Value>(httpCodes: HTTPCodes) -> AnyPublisher<Value, Error> where Value: Decodable {
        return tryMap {
            if NetworkConfiguration.shared.currentEnvironment.isMock {
                return $0.0
            }
            assert(!Thread.isMainThread)
            guard let code = ($0.1 as? HTTPURLResponse)?.statusCode else {
                throw NetworkError.unexpectedResponse
            }
            guard httpCodes.contains(code) else {
                throw NetworkError.apiError(code)
            }
            return $0.0
        }
        .extractUnderlyingError()
        .decode(type: Value.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

