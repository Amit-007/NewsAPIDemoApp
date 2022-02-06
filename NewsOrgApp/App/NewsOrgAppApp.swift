//
//  NewsOrgAppApp.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import SwiftUI

@main
struct NewsOrgAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                NewsDashboardView(viewModel: NewsDashboardViewModel(webservice: NewsArticleWebService()))
            }
        }
    }
}
