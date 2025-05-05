//
//  UserImageRow.swift
//  Robinhood
//
//  Created by Janarthanan Kannan on 05/05/25.
//

import SwiftUI

struct UserImageRow: View {
    let images: [String]

    var body: some View {
        HStack(spacing: -10) {
            ForEach(images.indices, id: \.self) { index in
                Image(systemName: images[index])
                    .font(.system(size: 30))
                    .padding(6)
                    .background(Circle().fill(Color.white))
                    .overlay(Circle().stroke(Color.gray.opacity(0.2), lineWidth: 1))
                    .zIndex(Double(images.count - index))
            }
        }
        .padding()
    }
}
