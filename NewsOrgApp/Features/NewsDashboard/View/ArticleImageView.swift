//
//  ArticleImageView.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/6/22.
//

import SwiftUI

struct ArticleImageView<Placeholder>: View where Placeholder: View {
    
    var placeholder:() -> Placeholder
    
    @ObservedObject var imageLoader: ImageLoaderAndCache

    init(@ViewBuilder placeholder: @escaping() -> Placeholder, url: String) {
        self.placeholder = placeholder
        imageLoader = ImageLoaderAndCache(imageURL: url)
    }
    
    var body: some View {
        if !imageLoader.isFinished {
            placeholder()
        } else {
            if let image = self.imageLoader.image {
                Image(uiImage: image)
                      .resizable()
                      .scaledToFill()
            } else {
                placeholder()
            }
        }
    }
}
