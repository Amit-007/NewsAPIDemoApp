//
//  NewsDashboardView.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import SwiftUI

struct NewsDashboardView<ViewModel>: View where ViewModel: NewsDashboardViewModelProtocol {
    
    @ObservedObject var viewModel: ViewModel
    @State var isLoading: Bool = true
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(viewModel.articles, id:\.id) { article in
                NavigationLink(destination: NewsArticleDetailView(article: article,
                                                                  viewModel: NewsArticleDetailViewModel(articleID: article.articleID,
                                                                                                        webservice: NewsDetailWebService()))) {
                    NewsArticleView(article: article)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .onAppear {
            viewModel.fetchNewsHeadlines {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.isLoading = false
                }
            }
        }
        .navigationTitle(viewModel.title)
        .unredacted(when: !isLoading)
    }
}

