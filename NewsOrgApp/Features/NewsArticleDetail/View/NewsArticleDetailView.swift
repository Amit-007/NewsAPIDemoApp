//
//  NewsArticleDetailView.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/6/22.
//

import SwiftUI

struct NewsArticleDetailView<ViewModel>: View where ViewModel: NewsArticleDetailViewModelProtocol {
    
    var article: Article
    @ObservedObject var viewModel: ViewModel
    @State var isLoading: Bool = true
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                Text(article.title ?? "")
                    .foregroundColor(.primary)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                    .padding(.bottom, 20)
                    .show(when: !(article.title?.isEmptyString ?? true))
                Text(article.description ?? "")
                    .foregroundColor(.primary)
                    .font(.body)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                    .show(when: !(article.description?.isEmptyString ?? true))
                LikesCommentsToolbarView(likes: viewModel.likes.likes ?? .zero,
                                         comments: viewModel.comments.comments ?? .zero)
                Text(article.content ?? "")
                    .foregroundColor(.primary)
                    .lineLimit(3)
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
                    .show(when: !(article.content?.isEmptyString ?? true))
                Text(article.footnote)
                    .foregroundColor(.gray)
                    .font(.caption)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 15)
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
        .unredacted(when: !isLoading)
    }
}
