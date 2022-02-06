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
    private let delay: Double = 0.5
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            if viewModel.hasErrorOccured.occured {
                    Text("\n\n\n\n\n\nSome Error Occured, please check ApiKey & make sure its included")
                    .font(.largeTitle)
                    .bold()
                    .padding()
            } else {
                ForEach(viewModel.articles, id:\.id) { article in
                    NavigationLink(destination: NewsArticleDetailView(article: article,
                                                                      viewModel: NewsArticleDetailViewModel(articleID: article.articleID,
                                                                                                            webservice: NewsDetailWebService()))) {
                        NewsArticleView(article: article)
                    }
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .onAppear {
            viewModel.fetchNewsHeadlines {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    self.isLoading = false
                }
            }
        }
        .navigationTitle(viewModel.title)
        .unredacted(when: !isLoading)
    }
}

