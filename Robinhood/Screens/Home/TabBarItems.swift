//
//  TabBarItems.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import Foundation

enum TabBarItems: Int, CaseIterable {
    case home = 0
    case bar
    case pie
    case profile


    var iconName: String {
        switch self {
        case .home:
            return "house.fill"
        case .bar:
            return "chart.bar.xaxis"
        case .pie:
            return  "chart.pie.fill"
        case .profile:
            return "person.fill"
        }
    }
}
