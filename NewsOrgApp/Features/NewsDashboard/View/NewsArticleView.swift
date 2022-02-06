//
//  NewsArticleView.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import SwiftUI

struct NewsArticleView: View {
    
    var article: Article
    
    var body: some View {
        ZStack {
            Color.gray
            VStack(alignment: .leading, spacing: 10) {
                Spacer()
                Text(article.title ?? "")
                    .foregroundColor(.white)
                    .font(.headline)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding([.top, .horizontal], 10)
                    .show(when: !(article.title?.isEmptyString ?? true))
                Text(article.content ?? "")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .padding([.top, .horizontal], 10)
                    .show(when: !(article.content?.isEmptyString ?? true))
                Text(article.footnote)
                    .foregroundColor(.white)
                    .font(.caption)
                    .bold()
                    .padding([.top, .horizontal], 10)
                    .padding(.bottom, 25)
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
