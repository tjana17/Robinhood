//
//  TabBarButton.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import SwiftUI

struct TabBarButton: View {

    let isActive: Bool
    let iconName: String
    let action: () -> Void

    var body: some View {

        VStack(alignment: .center, spacing: 2) {
            Image(systemName: iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(isActive ? .white : .gray)
        }
        .onTapGesture {
            if !isActive {
                action()
            }
        }

    }
}
