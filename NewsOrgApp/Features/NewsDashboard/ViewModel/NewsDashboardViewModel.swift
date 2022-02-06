//
//  NewsDashboardViewModel.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Foundation
import Combine

final class NewsDashboardViewModel: NewsDashboardViewModelProtocol {
    
    var title: String = "News"
    var pageNumber: Int = 1
    
    @Published var articles: [Article] = []
    @Published var hasErrorOccured: (occured: Bool, error: Error?) = (false, nil)
    
    private var webservice: NewsArticleWebServiceProtocol
    private var cancellableSet: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(webservice: NewsArticleWebServiceProtocol = NewsArticleWebService()) {
        self.webservice = webservice
    }
    
    func fetchNewsHeadlines(completion: @escaping() -> Void) {
        self.webservice.fetchTopHeadlines(pageNumber: pageNumber)
            .mapError { (error) -> Error in
                self.hasErrorOccured = (true, error)
                completion()
                return error
            }.sink { _ in
            // Nothing To Do
            } receiveValue: { newsHeadlines in
                self.articles = newsHeadlines.articles
                completion()
            }
            .store(in: &cancellableSet)
    }

}
