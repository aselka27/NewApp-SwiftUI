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
        NavigationView {
            Group {
                switch viewModel.state {
                case .failed(error: let error):
                    ErrorView(error: error, handler: viewModel.getArticles)
                default:
                    List(viewModel.isLoading ? Article.dummyData : viewModel.articles) { article in
                        ArticleView(isLoading: viewModel.isLoading, article: article)
                            .onTapGesture {
                                load(url: article.url)
                            }
                    }
                    .navigationTitle("News")
                }
            }
            .onAppear(perform: viewModel.getArticles)
        }
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
