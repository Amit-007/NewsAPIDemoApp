//
//  NewsArticleDetailViewModelProtocol.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/6/22.
//

import Foundation
import Combine

protocol NewsArticleDetailViewModelProtocol: ObservableObject {
    
    var title: String { get }
    var articleID: String { get set }
    var likes: Likes { get }
    var comments: Comments { get }

    var hasErrorOccured: (occured: Bool, error: Error?) { get }
    
    func fetchNewsArticleCommentsAndLikes(completion: @escaping() -> Void)
}
