//
//  NewsEndpoint.swift
//  NewApp+SwiftUI
//
//  Created by саргашкаева on 20.02.2023.
//

import Foundation


protocol APIBuilder {
    var urlResuest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum NewsApi {
    case getNews
}

extension NewsApi: APIBuilder {
    
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        return "/news"
    }
    
    var urlResuest: URLRequest {
        switch self {
        case .getNews:
            return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
        }
    }
}
