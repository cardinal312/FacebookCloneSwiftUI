//
//  TagView.swift
//  FacebookClone
//
//  Created by Macbook on 21/2/24.
//

import SwiftUI

struct TagView: View {
    private let title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .font(.subheadline)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

