//
//  APIError.swift
//  NewApp+SwiftUI
//
//  Created by саргашкаева on 20.02.2023.
//

import Foundation


enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown 
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Failed to decode the object from the server"
        case .errorCode(let code):
            return "\(code) - Something went wrong"
        case .unknown:
            return "The error is unknown"
        }
    }
}
