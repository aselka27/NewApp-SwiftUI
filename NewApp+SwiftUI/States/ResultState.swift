//
//  ResultStates.swift
//  NewApp+SwiftUI
//
//  Created by саргашкаева on 20.02.2023.
//

import Foundation

enum ResultState: Equatable {
   
    case loading
    case success(content: [Article])
    case failed(error: Error)
    
    static func == (lhs: ResultState, rhs: ResultState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.failed(error: let lhsType), .failed(error: let rhsType)):
            return lhsType.localizedDescription == rhsType.localizedDescription
        case (.success(content: let lhsType), .success(content: let rhsType)):
            return lhsType == rhsType
        default:
            return false
        }
    }
}
