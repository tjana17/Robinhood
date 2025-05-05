//
//  MenuView.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    InfoCardView(title: "Investing", description: "Balances, recurring investments, DRIP, Stock Lending")
                    InfoCardView(title: "Crypto", description: "Transfer limits")
                    InfoCardView(title: "Transfers", description: "Deposits, widthdrawls, account transfers")
                    InfoCardView(title: "Rewards", description: "Invite friends, earn stocks, get rewards")
                    InfoCardView(title: "History", description: "Activity across all accounts")
                    InfoCardView(title: "Reports and statements", description: "Account activity reports, montly statements")
                    InfoCardView(title: "Tax center", description: "Tax documents, FAQ's")
                    Spacer()
                }
                Button {} label: {
                    Text("Log out")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .foregroundColor(.white)
                        .font(.system(size: 17).bold())
                        .padding()
                        .background(.blue)
                        .cornerRadius(25)
                }
                .padding()
            }
            .background(.black)
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarTitleTextColor(Color.white)
        }
    }
}

#Preview {
    MenuView()
}
