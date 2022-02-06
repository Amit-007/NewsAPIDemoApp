//
//  NewsDashboardViewModelProtocol.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Foundation
import Combine

protocol NewsDashboardViewModelProtocol: ObservableObject {
    
    var title: String { get }
    var articles: [Article] { get }
    var pageNumber: Int { get set }
    
    var hasErrorOccured: (occured: Bool, error: Error?) { get }
    
    func fetchNewsHeadlines(completion: @escaping() -> Void)
}
