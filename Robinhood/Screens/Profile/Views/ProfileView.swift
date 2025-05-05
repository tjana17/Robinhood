//
//  ProfileView.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import SwiftUI

struct ProfileView: View {

    @State private var showMenu: Bool = false
    let pieData = [
           PieData(category: "Stocks", value: 40, color: .red),
           PieData(category: "ETFs", value: 25, color: .blue),
           PieData(category: "Crypto", value: 20, color: .green),
           PieData(category: "Options", value: 15, color: .yellow)
       ]

    var body: some View {
        NavigationStack {
            VStack {
                headerView()
                ScrollView(.vertical) {
                    VStack {
                        userProfileView()
                        CardRowView(imageName: "person.text.rectangle", title: "Get a 4.5% APY boos on your brokerage cash! Terms Apply.", description: "", spacing: 0)
                            .padding(.horizontal)
                        investingView()
                        PieChartView(data: pieData)
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Stocks are pieces of a company that investors can own.")
                                .foregroundColor(.gray)
                            Button {} label: {
                                Text("Learn more")
                                    .foregroundStyle(.blue)
                            }
                        }
                        .padding()
                        DiscoverView()
                        Spacer()
                    }
                }
                Spacer()
                ZStack(alignment: .bottom) {
                    footerRewardsView()
                }
            }
            .background(.black)

            .navigationDestination(isPresented: $showMenu) {
                MenuView()
            }
        }
    }


    private func headerView() -> some View {
        HStack(spacing: 30) {
            Button {
                // Show Menu View
                showMenu = true
            } label: {
                Image(systemName: "line.3.horizontal")
                    .foregroundColor(.white)
                    .font(.system(size: 20).bold())
            }
            Spacer()
            Button {
                // Search Button Click
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                    .font(.system(size: 20).bold())
            }
            Button {
                // Notification Button Click
            } label: {
                Image(systemName: "bell.badge.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 20).bold())
            }
        }
        .padding()
    }

    private func investingView() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Individual investing")
                    .foregroundColor(.white)
                Image(systemName: "info.circle")
                    .foregroundColor(.gray)
            }
            .font(.system(size: 24).bold())
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Total individual value")
                        .font(.system(size: 19).bold())
                        .foregroundColor(.white)
                    Text("Individual holdings")
                    Text("Individual cash")
                    Text("Crypto holdings")
                }
                .font(.system(size: 17))
                .foregroundColor(.gray)
                Spacer()

                VStack(alignment: .trailing, spacing: 8) {
                    Text("$93.22")
                        .font(.system(size: 19).bold())
                        .foregroundColor(.white)
                    Text("$12.32")
                    Text("$0.00")
                    Text("$12.12")
                }
                .font(.system(size: 17))
                .foregroundColor(.gray)
            }
        }
        .padding()
    }

    private func userProfileView() -> some View {
        VStack(spacing: 10) {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 60).bold())
            Text("@JanaKannan")
                .font(.system(size: 15).bold())
            Text("$94.22")
                .font(.system(size: 35).bold())
            Text("Total in Robinhood")
                .font(.system(size: 15))
            Button {
            } label: {
                Text("Add account")
                    .font(.system(size: 16).bold())
                    .foregroundColor(.blue)
            }
        }
        .foregroundColor(.white)
    }

    private func footerRewardsView() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("2 invites")
                    .foregroundColor(.blue)
                HStack(alignment: .top) {
                    UserImageRow(images: ["person.fill", "person.fill"])
                }
            }
            Button {

            } label: {
                Text("Earn rewards")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(.white)
                    .font(.system(size: 17).bold())
                    .padding()
                    .background(.blue)
                    .cornerRadius(25)
            }
        }
        .padding(.horizontal)
    }

}

#Preview {
    ProfileView()
}

struct PieData: Identifiable {
    let id = UUID()
    let category: String
    let value: Double
    let color: Color
}



