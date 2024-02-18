//
//  CustomButton.swift
//  FacebookClone
//
//  Created by Macbook on 18/2/24.
//

import SwiftUI

struct CustomButton: View {
    private let imageName: String?
    private let title: String?
    private let backgroundColor: Color?
    private let forgroundColor: Color?
    
    init(imageName: String, title: String, backgroundColor: Color, forgroundColor: Color) {
        self.imageName = imageName
        self.title = title
        self.backgroundColor = backgroundColor
        self.forgroundColor = forgroundColor
    }

    var body: some View {
        HStack {
            Image(systemName: imageName ?? "star")
            Text(title ?? "")
                .font(.footnote)
                .fontWeight(.semibold)
        }
        .foregroundColor(forgroundColor)
        .padding(.horizontal)
        .frame(height: 34)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

