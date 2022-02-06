//
//  NewsArticleDetailView.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/6/22.
//

import SwiftUI

struct NewsArticleDetailView<ViewModel>: View where ViewModel: NewsArticleDetailViewModelProtocol {
    
    var article: Article
    
    private let padding: CGFloat = 15
    private let spacing: CGFloat = 8
    private let imageHeight: CGFloat = 200
    private let lineLimit: Int = 3

    @ObservedObject var viewModel: ViewModel
    @State var isLoading: Bool = true
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: spacing) {
                if let imagePath = article.urlToImage {
                    ArticleImageView(placeholder: {
                        Color.red
                    }, url: imagePath)
                        .frame(width: UIScreen.main.bounds.width, height: imageHeight, alignment: .center)
                        .clipped()
                }
                Spacer()
                Text(article.title ?? .empty)
                    .foregroundColor(.primary)
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, padding)
                    .padding(.bottom, padding)
                    .show(when: !(article.title?.isEmptyString ?? true))
                Text(article.description ?? .empty)
                    .foregroundColor(.primary)
                    .font(.body)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, padding)
                    .show(when: !(article.description?.isEmptyString ?? true))
                LikesCommentsToolbarView(likes: viewModel.likes.likes ?? .zero,
                                         comments: viewModel.comments.comments ?? .zero)
                Text(article.content ?? .empty)
                    .foregroundColor(.primary)
                    .lineLimit(lineLimit)
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, padding)
                    .show(when: !(article.content?.isEmptyString ?? true))
                Text(article.footnote)
                    .foregroundColor(.gray)
                    .font(.caption)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, padding)
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
