//
//  LineChartView.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import SwiftUI
import Charts

struct LineChartView: View {
    let data: [DataPoint]

    var body: some View {
        Chart {
            ForEach(data) { point in
                LineMark(
                    x: .value("Label", point.label),
                    y: .value("Value", point.value)
                )
                .interpolationMethod(.monotone)
            }
        }
        .chartXAxis {
            AxisMarks(preset: .aligned, values: .automatic) { value in
                AxisTick().foregroundStyle(Color.white)
                AxisValueLabel().foregroundStyle(Color.white)
            }
        }
        .chartYAxis {
            AxisMarks(values: .automatic) { value in
                AxisTick().foregroundStyle(Color.white)
                AxisValueLabel().foregroundStyle(Color.white)
            }
        }
        .frame(height: 200)
        .padding()
    }
}
