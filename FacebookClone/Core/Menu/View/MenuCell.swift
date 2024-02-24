//
//  MenuCell.swift
//  FacebookClone
//
//  Created by Macbook on 24/2/24.
//

import SwiftUI

struct MenuCell: View {
    private let iconName: String
    private let titleText: String
    
    init(iconName: String, titleText: String) {
        self.iconName = iconName
        self.titleText = titleText
    }
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
            HStack(spacing: 15) {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.gray)
                Text(titleText)
                Spacer()
                Image(systemName: "chevron.down")
            }
            .padding(.horizontal)
            .padding(.vertical, 7)
            .font(.headline)
        }
    }
}

