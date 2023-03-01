//
//  NewsViewModel.swift
//  NewApp+SwiftUI
//
//  Created by саргашкаева on 20.02.2023.
//

import Foundation
import Combine

protocol NewsViewModelProtocol {
    func getArticles()
    var isLoading: Bool { get }
}

class NewsViewModel: ObservableObject, NewsViewModelProtocol {
    
    private let service: NewsService
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
   @Published private(set) var state: ResultState = .loading
    var isLoading: Bool {
        self.state == .loading
    }
    
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        self.state = .loading
       
        let cancellable = service
            .request(from: .getNews)
            .sink { [weak self] res in
                switch res {
                case .finished:
                    self?.state = .success(content: self!.articles)
                    // send back the articles
                case .failure(let error):
                    // send back the error
                    self?.state = .failed(error: error)
                }
            } receiveValue: { [weak self] response in
                self?.articles = response.articles
            }
        self.cancellables.insert(cancellable)

        
    }
}

