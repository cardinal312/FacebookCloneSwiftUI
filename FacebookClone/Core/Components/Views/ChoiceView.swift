//
//  ChoiceView.swift
//  FacebookClone
//
//  Created by Macbook on 20/2/24.
//

import SwiftUI

struct ChoiceView: View {
    private let iconName: String?
    private let iconText: String?
    
    init(iconName: String?, iconText: String?) {
        self.iconName = iconName
        self.iconText = iconText
    }
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: iconName ?? "")
                .frame(width: 14, height: 12)
            Text(iconText ?? "")
            Text("▼")
                .font(.caption2)
        }
        .foregroundStyle(.blue)
        .font(.subheadline)
        .fontWeight(.bold)
        .padding(.horizontal)
        .padding(.vertical, 5)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

