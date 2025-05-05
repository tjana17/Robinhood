//
//  NavigationbarExtension.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import SwiftUI

extension View {
    
    /// Supports both regular and large titles.
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)

        // Set appearance for both normal and large sizes.
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]

        return self
    }
}
