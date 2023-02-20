//
//  HomeView.swift
//  NewApp+SwiftUI
//
//  Created by саргашкаева on 20.02.2023.
//

import SwiftUI

struct HomeView: View {
   
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel = NewsViewModel(service: NewsServiceImpl())
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(error: let error):
                ErrorView(error: error, handler: viewModel.getArticles)
            case .success(content: let articles):
                NavigationView {
                    List(articles) { article in
                        ArticleView(article: article)
                            .onTapGesture {
                                load(url: article.url)
                            }
                    }
                    .navigationTitle(Text("News"))
                }
            }
        } .onAppear(perform: viewModel.getArticles)
    }
    
    func load(url: String?) {
        guard let link = url,
              let url = URL(string: link) else { return }
        openUrl(url)
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
