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
    
    var body: some View {
        VStack {
            Divider()
            HStack(alignment: .center) {
                VStack {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(.red)
                    Text("\(likes)")
                        .foregroundColor(.black)
                        .font(.caption)
                        .bold()
                }
                Spacer()
                VStack {
                    Image(systemName: "message.fill")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
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
