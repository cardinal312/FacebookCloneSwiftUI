//
//  ReelReusableView.swift
//  FacebookClone
//
//  Created by Macbook on 18/2/24.
//

import SwiftUI

struct ReelReusableView: View {
    private let title: String
    private let imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
    
    var body: some View {
        HStack(spacing: 10) {
           Image(systemName: imageName)
                .resizable().scaledToFill()
                .frame(width: 16, height: 16)
                .foregroundStyle(.red)
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(Color(.darkGray))
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 8)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

