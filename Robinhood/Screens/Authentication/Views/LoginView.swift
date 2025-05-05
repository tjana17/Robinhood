//
//  LoginView.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var showHome: Bool = false
    @State private var showSignup: Bool = false
    @StateObject private var viewModel = AuthenticationViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                Image("login")
                    .resizable()
                    .scaledToFit()

                if let message = viewModel.validationMessage {
                    Text(message)
                        .font(.system(size: 13))
                        .foregroundColor(.red)
                        .padding(.leading, 16)
                }

                VStack(alignment: .leading, spacing: 16) {
                    Text("Log in")
                        .font(.system(size: 44).bold())

                    CustomTextField(
                        text: $viewModel.email,
                        placeholder: "Email Address",
                        iconName: "envelope.fill",
                        buttonImage: ""
                    ) {} 

                    SecureInputField(
                        text: $viewModel.password,
                        placeholder: "Password",
                        iconName: "lock.fill"
                    )
                    .padding(.bottom, 20)
                    Button {
                        Task {
                            showHome = await viewModel.signIn()
                        }
                    } label: {
                        Text("Log in")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .foregroundColor(.white)
                            .font(.system(size: 17).bold())
                            .padding()
                            .background(.black)
                            .cornerRadius(25)
                    }
                }
                .padding()

                HStack {
                    Text("Don't have an account?")

                    Text("Sign up")
                        .font(.system(size: 18).bold())
                        .onTapGesture {
                            print("Sign up tapped...")
                            showSignup = true
                        }
                }
                .padding(.bottom, 50)
            }
            .navigationDestination(isPresented: $showSignup) {
                SignupView()
            }
            .fullScreenCover(isPresented: $showHome) {
                HomeView()
            }
        }
    }
}

#Preview {
    LoginView()
}
