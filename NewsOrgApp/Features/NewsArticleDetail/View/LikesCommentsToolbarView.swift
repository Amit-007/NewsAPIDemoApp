//
//  LikesCommentsToolbarView.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/6/22.
//

import SwiftUI

struct LikesCommentsToolbarView: View {
    
    let likes: Int
    let comments: Int
    
    private let height: CGFloat = 30
    private let width: CGFloat = 30

    var body: some View {
        VStack {
            Divider()
            HStack(alignment: .center) {
                VStack {
                    Image(systemName: SystemImage.heartFilled.rawValue)
                        .resizable()
                        .frame(width: width, height: height, alignment: .center)
                        .foregroundColor(.red)
                    Text("\(likes)")
                        .foregroundColor(.black)
                        .font(.caption)
                        .bold()
                }
                Spacer()
                VStack {
                    Image(systemName: SystemImage.messageFilled.rawValue)
                        .resizable()
                        .frame(width: width, height: height, alignment: .center)
                        .foregroundColor(.black)
                    Text("\(comments)")
                        .foregroundColor(.black)
                        .font(.caption)
                        .bold()
                }
            }
            Divider()
        }
        .padding()
    }
}

struct LikesCommentsToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        LikesCommentsToolbarView(likes: 43, comments: 47)
            .previewLayout(.sizeThatFits)
    }
}
