//
//  HomeView.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    @State private var isVisible = true

    let sampleData = [
        DataPoint(label: "A", value: 3),
        DataPoint(label: "B", value: 5),
        DataPoint(label: "C", value: 2),
        DataPoint(label: "D", value: 8),
        DataPoint(label: "E", value: 6),
        DataPoint(label: "F", value: 2),
        DataPoint(label: "G", value: 3),
        DataPoint(label: "H", value: 5),
        DataPoint(label: "I", value: 6),
        DataPoint(label: "J", value: 2),
        DataPoint(label: "K", value: 3),
        DataPoint(label: "L", value: 5)
    ]

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                contentView
                    .tag(0)
                TabChartsView()
                    .background(.black)
                    .tag(1)
                TabChartsView()
                    .background(.black)
                    .tag(2)
                ProfileView()
                    .tag(3)
            }

            CustomTabbar(selectedTab: $selectedTab, isVisible: $isVisible)
        }
    }

    var contentView: some View {
        NavigationStack {
            VStack {
                headerView()
                ScrollView(.vertical) {
                    VStack {
                        LineChartView(data: sampleData)
                        Divider()
                            .background(.white)
                            .foregroundColor(.white)
                        cashView()
                        predictionView()
                        DiscoverView()
                        Spacer()
                    }
                }
                Spacer()
            }
            .background(.black)
        }
    }

    private func headerView() -> some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Investing")
                            .font(.system(size: 30).bold())
                            .foregroundStyle(.white)
                        Image(systemName: "chevron.down")
                            .font(.system(size: 15).bold())
                            .foregroundColor(.white)
                    }
                    VStack {
                        Text("$97.81")
                            .font(.system(size: 30).bold())
                            .foregroundStyle(.white)
                    }
                }
                Spacer()
                Button {

                } label: {
                    Text("Earn $5")
                        .frame(minWidth: 0, maxWidth: 100)
                        .foregroundColor(.white)
                        .font(.system(size: 17).bold())
                        .padding()
                        .background(.yellow.opacity(0.8))
                        .cornerRadius(25)
                }
            }
        }
        .padding()
    }

    private func cashView() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Cash")
                .foregroundColor(.white)
                .font(.system(size: 24).bold())
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Cash Balance")
                        .font(.system(size: 19).bold())
                        .foregroundColor(.white)
                    Text("Current Interest Rate")
                }
                .font(.system(size: 17))
                .foregroundColor(.gray)
                Spacer()

                VStack(alignment: .trailing, spacing: 8) {
                    Text("$93.22")
                        .font(.system(size: 19).bold())
                        .foregroundColor(.white)
                    Text("0% APY")
                }
                .font(.system(size: 17))
                .foregroundColor(.gray)
            }
            Button {

            } label: {
                Text("Earn 4.5% APY")
                    .foregroundColor(.green)
                    .font(.system(size: 17).bold())
            }
        }
        .padding()
    }

    private func predictionView() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Prediction markets")
                .foregroundColor(.white)
                .font(.system(size: 24).bold())
            VStack {
                CardRowView(imageName: "tray.2.fill", title: "Fed decision in May", description: "", spacing: 0)
                CardRowView(imageName: "tray.2.fill", title: "Inflation in April", description: "", spacing: 0)
            }
        }
        .padding()
    }

}

#Preview {
    HomeView()
}

struct DataPoint: Identifiable {
    var id = UUID()
    var label: String
    var value: Double
}
