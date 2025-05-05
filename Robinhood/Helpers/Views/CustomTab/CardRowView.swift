//
//  CardRowView.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import SwiftUI

struct CardRowView: View {
    var imageName: String
    var title: String
    var description: String
    var spacing: CGFloat = 0
    var imageColor: Color = .white

    var body: some View {
        HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(imageColor)

            VStack(alignment: .leading, spacing: spacing) {
                Text(title)
                    .font(.headline)
                    .multilineTextAlignment(.leading)

                Text(description)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.gray)

            }
            .foregroundColor(.white)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.3))
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        )
    }
}
