//
//  View+Extension.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import SwiftUI

extension View {
    
    /// This function typically typecasts a particular view of the type `AnyView`
    /// - Returns: AnyView
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
