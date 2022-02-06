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
        fetchAPIKey()
    }
    
    func fetchAPIKey() {
        var resourceFileDictionary: NSDictionary?
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            resourceFileDictionary = NSDictionary(contentsOfFile: path)
            if let infoDict = resourceFileDictionary {
                NewsAPIStore.shared.apiKey = infoDict["ApiKey"] as! String
                print("ApiKey:>>> \(NewsAPIStore.shared.apiKey) Found")
            }
        }
    }
    
    func fetchNewsHeadlines(completion: @escaping() -> Void) {
        if NewsAPIStore.shared.apiKey.isEmptyString {
            let error = NSError(domain: "API Key Not Found", code: 500, userInfo: nil)
            hasErrorOccured = (true, error)
            completion()
        } else {
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

}
