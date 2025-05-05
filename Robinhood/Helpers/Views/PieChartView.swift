//
//  PieChartView.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import SwiftUI
import Charts

struct PieChartView: View {
    let data: [PieData]

    var body: some View {
        VStack {
            Chart(data) { item in
                SectorMark(
                    angle: .value("Value", item.value)
                )
                .foregroundStyle(item.color)
            }
            .frame(height: 300)

            HStack {
                ForEach(data) { item in
                    HStack {
                        Circle()
                            .fill(item.color)
                            .frame(width: 10, height: 10)
                        Text(item.category)
                            .foregroundColor(.white)
                            .font(.caption)
                    }
                }
            }
            .padding(.top)
        }
        .padding()
        .background(Color.black)
    }
}
