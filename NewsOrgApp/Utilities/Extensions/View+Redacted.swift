//
//  View+Redacted.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import SwiftUI

extension View {
    @ViewBuilder func unredacted(when condition: Bool) -> some View {
        if condition {
            unredacted()
        } else {
            redacted(reason: .placeholder)
        }
    }
}

