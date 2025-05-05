//
//  CustomTextField.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    var iconName: String
    var buttonImage: String
    var onButtonTapped: () -> Void

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.gray)
                .padding(.leading, 10)

            TextField(placeholder, text: $text)
                .padding(.vertical, 10)
                .padding(.horizontal, 5)

            Button(action: onButtonTapped) {
                Image(systemName: buttonImage)
                    .foregroundColor(.blue)
                    .padding(.trailing, 10)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}
