//
//  ContentView.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import SwiftUI

struct WelcomeScreen: View {
    @State private var showLogin: Bool = false
    @State private var showSignup: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                Image("getstarted")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    HStack(spacing: 20) {
                        Button {
                            showLogin = true
                        } label: {
                            Text("Log in")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .foregroundColor(.black)
                                .font(.system(size: 17).bold())
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.black, lineWidth: 2))
                        }
                        
                        Button {
                            showSignup = true
                        } label: {
                            Text("Sign up")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .foregroundColor(.white)
                                .font(.system(size: 17).bold())
                                .padding()
                                .background(.black)
                                .cornerRadius(25)
                        }
                    }
                    .padding()
                    .padding(.bottom, 40)
                }
            }
            .navigationDestination(isPresented: $showLogin) {
                LoginView()
            }
            .navigationDestination(isPresented: $showSignup) {
                SignupView()
            }
        }
    }
}

#Preview {
    WelcomeScreen()
}
