//
//  View+Visibility.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import SwiftUI

extension View {
    @ViewBuilder func show(when condition: Bool) -> some View {
        if condition {
            self
        } else {
            EmptyView()
        }
    }
}
