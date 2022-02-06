//
//  NewsArticleView.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import SwiftUI

struct NewsArticleView: View {
    
    var article: Article
    
    private let padding: CGFloat = 15
    private let spacing: CGFloat = 8
    private let lineLimit: Int = 3
    
    var body: some View {
        ZStack {
            Color.gray
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
        }
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleView(article: Article.build())
            .previewLayout(.sizeThatFits)
    }
}
