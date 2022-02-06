//
//  NewsArticleDetailViewModel.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/6/22.
//

import Foundation
import Combine

final class NewsArticleDetailViewModel: NewsArticleDetailViewModelProtocol {
    
    var articleID: String
    var title: String = "News Detail"
    
    @Published var hasErrorOccured: (occured: Bool, error: Error?) = (false, nil)
    @Published var comments: Comments = Comments.build()
    @Published var likes: Likes  = Likes.build()

    private var webservice: NewsDetailWebServiceProtocol
    private var cancellableSet: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(articleID: String, webservice: NewsDetailWebServiceProtocol = NewsDetailWebService()) {
        self.articleID = articleID
        self.webservice = webservice
    }
    
    func fetchNewsArticleCommentsAndLikes(completion: @escaping() -> Void) {
        let group = DispatchGroup()
        group.enter()
        self.webservice.fetchComments(for: articleID)
            .mapError { (error) -> Error in
                self.hasErrorOccured = (true, error)
                completion()
                return error
            }.sink { _ in
                // Nothing To Do
            } receiveValue: { comments in
                self.comments = comments
                group.leave()
            }
            .store(in: &cancellableSet)
        group.enter()
        self.webservice.fetchLikes(for: articleID)
            .mapError { (error) -> Error in
                self.hasErrorOccured = (true, error)
                completion()
                return error
            }.sink { _ in
                // Nothing To Do
            } receiveValue: { likes in
                self.likes = likes
                group.leave()
            }
            .store(in: &cancellableSet)
        group.notify(queue: .main) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                completion()
            }
        }
    }
    
    
}
