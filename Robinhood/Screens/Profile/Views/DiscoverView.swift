//
//  DiscoverView.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Discover more")
                    .foregroundColor(.white)
                Image(systemName: "info.circle")
                    .foregroundColor(.gray)
            }
            .font(.system(size: 24).bold())
            VStack {
                CardRowView(imageName: "percent", title: "4.5% APY with Gold", description: "Boost your rate on uninvested cash", spacing: 0)
                CardRowView(imageName: "australsign.square.fill", title: "Robinhood Strategies", description: "Get access to an expert-managed portfolio", spacing: 0)
                CardRowView(imageName: "square.and.arrow.down.fill", title: "Retirement", description: "Earn upto 2% on IRA transfers till April 30", spacing: 0)
                CardRowView(imageName: "externaldrive", title: "Transfer accounts in", description: "Consolidate assets", spacing: 0)
            }
        }
        .padding()
    }

}
