//
//  NewsArticledetailView+Extension.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/6/22.
//

import SwiftUI

// MARK: - NewsArticleDetailView Extension - 
extension NewsArticleDetailView {
    
    /// `newsArticleImageView` Renders News Article Image
    var newsArticleImageView: some View {
        Group {
            if let imagePath = article.urlToImage {
                ArticleImageView(placeholder: {
                    Color.red
                }, url: imagePath)
                    .frame(width: UIScreen.main.bounds.width, height: imageHeight, alignment: .center)
                    .clipped()
            }
        }
    }
    
    /// `newsArticleDescription` Renders News Article Description
    var newsArticleDescription: some View {
        Group {
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
    }
}
