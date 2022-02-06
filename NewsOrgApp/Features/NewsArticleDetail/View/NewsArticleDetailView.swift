//
//  NewsArticleDetailView.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/6/22.
//

import SwiftUI

struct NewsArticleDetailView<ViewModel>: View where ViewModel: NewsArticleDetailViewModelProtocol {
    
    var article: Article
    
    let padding: CGFloat = 15
    let spacing: CGFloat = 8
    let imageHeight: CGFloat = 200
    let lineLimit: Int = 3
    
    @ObservedObject var viewModel: ViewModel
    @State var isLoading: Bool = true
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: spacing) {
                newsArticleImageView
                Spacer()
                newsArticleDescription
            }
            .onAppear {
                viewModel.fetchNewsArticleCommentsAndLikes {
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        self.isLoading = false
                    }
                }
            }
        }
        .navigationTitle(viewModel.title)
        .navigationBarTitleDisplayMode(.inline)
        .unredacted(when: !isLoading)
    }
}
