//
//  SignupView.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import SwiftUI

struct SignupView: View {
    
    @State private var showLogin: Bool = false
    @StateObject private var viewModel = AuthenticationViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                Image("signup")
                    .resizable()
                    .scaledToFit()

                if let message = viewModel.validationMessage {
                    Text(message)
                        .font(.system(size: 13))
                        .foregroundColor(.red)
                        .padding(.leading, 16)
                }

                VStack(alignment: .leading, spacing: 16) {
                    Text("Sign up")
                        .font(.system(size: 44).bold())

                    CustomTextField(
                        text: $viewModel.name,
                        placeholder: "Name",
                        iconName: "person.fill",
                        buttonImage: ""
                    ) {}

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

                    SecureInputField(
                        text: $viewModel.confirmPassword,
                        placeholder: "Confirm Password",
                        iconName: "lock.fill"
                    )
                    .padding(.bottom, 20)

                    Button {
                        Task {
                            showLogin = await viewModel.signup()
                        }
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

                HStack {
                    Text("Already have an account?")

                    Text("Log in")
                        .font(.system(size: 18).bold())
                        .onTapGesture {
                            showLogin = true
                        }
                }
                .padding(.bottom, 50)
            }
            .navigationDestination(isPresented: $showLogin) {
                LoginView()
            }
        }
    }
}

#Preview {
    SignupView()
}
