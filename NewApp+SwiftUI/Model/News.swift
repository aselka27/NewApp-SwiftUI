//
//  News.swift
//  NewApp+SwiftUI
//
//  Created by саргашкаева on 20.02.2023.
//

import Foundation


struct NewsModel: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?
    
    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}
