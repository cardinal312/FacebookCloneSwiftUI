//
//  VideoOptionsView.swift
//  FacebookClone
//
//  Created by Macbook on 24/2/24.
//

import SwiftUI

struct VideoOptionsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    Text("For you")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                        .padding(.horizontal)
                        .padding(.vertical, 7)
                        .background(Color(.systemGray5))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    Text("Live")
                        .videoOptionViewModifier()
                    Text("Gaming")
                        .videoOptionViewModifier()
                    Text("Reels")
                        .videoOptionViewModifier()
                    Text("Following")
                        .videoOptionViewModifier()
                }
            }
            .padding(.leading)
            Divider()
        }
        .padding(.vertical)
    }
}

struct VideoOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        VideoOptionsView()
    }
}
