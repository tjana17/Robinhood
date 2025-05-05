//
//  AuthenticationViewModel.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import Foundation

@MainActor
class AuthenticationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
    @Published var confirmPassword: String = ""
    @Published var validationMessage: String?
    
    func signIn() async -> Bool {
        if email.isEmpty {
            validationMessage = "Enter an email address"
            return false
        } else if password.isEmpty {
            validationMessage = "Enter a password"
            return false
        } else if !email.isEmpty {
            let validEmail = isValidEmail(email)
            validationMessage = validEmail ? "" : "Enter a valid email address"
            return validEmail
        }
        return false
    }

    func signup() async -> Bool {
        if name.isEmpty {
            validationMessage = "Enter your name"
            return false
        } else if email.isEmpty {
            validationMessage = "Enter your email address"
            return false
        } else if password.isEmpty {
            validationMessage = "Enter a password"
            return false
        } else if confirmPassword.isEmpty {
            validationMessage = "Please enter confirm password"
            return false
        } else if password != confirmPassword {
            validationMessage = "Password doesn't match"
            return false
        } else if !email.isEmpty {
            let validEmail = isValidEmail(email)
            validationMessage = validEmail ? "" : "Enter a valid email address"
            return validEmail
        }
        return false
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

