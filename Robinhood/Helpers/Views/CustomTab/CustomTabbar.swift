//
//  CustomTabbar.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import SwiftUI

struct CustomTabbar: View {
    @Binding var selectedTab: Int
    @Binding var isVisible: Bool

    var body: some View {
        GeometryReader { _ in
            if isVisible {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ForEach(TabBarItems.allCases, id: \.self) { item in
                            TabBarButton(isActive: (selectedTab == item.rawValue),
                                         iconName: item.iconName) {
                                withAnimation {
                                    selectedTab = item.rawValue
                                }
                            }
                            Spacer()
                        }
                    }
                    .frame(height: 50)
                    .background(Color.black)
                    .padding(.bottom, 0)
                }
            }
        }
    }
}

#Preview {
    struct Preview: View {
        @State var tab = 1
        @State var tabV = true
        var body: some View {
            CustomTabbar(selectedTab: $tab, isVisible: $tabV)
        }
    }

    return Preview()
}
