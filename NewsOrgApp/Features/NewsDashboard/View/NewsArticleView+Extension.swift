//
//  NewsArticleView+Extension.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/6/22.
//

import SwiftUI

// MARK: - NewsArticleView Extension -
extension NewsArticleView {
    
    /// `articleImageView` Displays Article Image
    var articleImageView: some View {
        Group {
            if let imagePath = article.urlToImage {
                ArticleImageView(placeholder: {
                    Color.gray
                }, url: imagePath)
                    .frame(width: UIScreen.main.bounds.width, height: imageHeight, alignment: .center)
                    .clipped()
            }
        }
    }
    
    /// `articleTextDetailView` Displays Article Textual Data
    var articleTextDetailView: some View {
        Group {
            VStack(alignment: .leading, spacing: spacing) {
                Spacer()
                Text(article.title ?? .empty)
                    .foregroundColor(.white)
                    .font(.headline)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding([.top, .horizontal], padding)
                    .show(when: !(article.title?.isEmptyString ?? true))
                Text(article.content ?? .empty)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(lineLimit)
                    .multilineTextAlignment(.leading)
                    .padding([.top, .horizontal], padding)
                    .show(when: !(article.content?.isEmptyString ?? true))
                Text(article.displayDate ?? .empty)
                    .foregroundColor(.white)
                    .font(.callout)
                    .bold()
                    .italic()
                    .padding([.top, .horizontal], padding)
                    .show(when: !(article.displayDate?.isEmptyString ?? true))
                Text(article.footnote)
                    .foregroundColor(.white)
                    .font(.caption)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding([.top, .horizontal], padding)
                    .padding(.bottom, padding)
            }
            .frame(width: UIScreen.main.bounds.width, height: textHeight)
            .background (
                Color.black.opacity(opacity)
            )
        }
    }
}
