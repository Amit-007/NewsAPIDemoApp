//
//  NewsArticleView.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import SwiftUI

// `NewsArticleView` This View is responsible to render News Article
struct NewsArticleView: View {
    
    // MARK: - Variables -
    var article: Article
    let padding: CGFloat = 15
    let spacing: CGFloat = 8
    let opacity: CGFloat = 0.4
    let imageHeight: CGFloat = 600
    let textHeight: CGFloat = 250
    let lineLimit: Int = 3
    
    // MARK: - View Body -
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            articleImageView
            Spacer()
            articleTextDetailView
        }
    }
}

// MARK: - Preview Provider -
struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleView(article: Article.build())
            .previewLayout(.sizeThatFits)
    }
}
