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

struct Article: Codable, Identifiable, Equatable {
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


extension Article {
    static var dummyData: [Article] {
        [.init(author: "Evan Peters, Jessica Chastain, Ryan Reynolds", url: "https://www.cnet.com/how-to/how-to-watch-spacex-launch-58-more-starlink-satellites-early-saturday-morning/", source: "Fox News", title: "Presidential Election", articleDescription: "Who is going to win the elections?", image: "https://img.zonebourse.com/reuters/2021-01/2021-01-08T135822Z_1_LYNXMPEH070TC-OCABS_RTROPTP_3_CBUSINESS-US-TESLA-MODEL-Y.JPG", date: Date()), .init(author: "Evan Peters, Jessica Chastain, Ryan Reynolds", url: "https://www.cnet.com/how-to/how-to-watch-spacex-launch-58-more-starlink-satellites-early-saturday-morning/", source: "Fox News", title: "Presidential Election", articleDescription: "Who is going to win the elections?", image: "https://img.zonebourse.com/reuters/2021-01/2021-01-08T135822Z_1_LYNXMPEH070TC-OCABS_RTROPTP_3_CBUSINESS-US-TESLA-MODEL-Y.JPG", date: Date()), .init(author: "Evan Peters, Jessica Chastain, Ryan Reynolds", url: "https://www.cnet.com/how-to/how-to-watch-spacex-launch-58-more-starlink-satellites-early-saturday-morning/", source: "Fox News", title: "Presidential Election", articleDescription: "Who is going to win the elections?", image: "https://img.zonebourse.com/reuters/2021-01/2021-01-08T135822Z_1_LYNXMPEH070TC-OCABS_RTROPTP_3_CBUSINESS-US-TESLA-MODEL-Y.JPG", date: Date())]
    }
}
