//
//  ManageProfilePostsView.swift
//  FacebookClone
//
//  Created by Macbook on 18/2/24.
//

import SwiftUI

struct ManageProfilePostsView: View {
    private let width: CGFloat
    init(width: CGFloat) {
        self.width = width
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Posts")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                Text("Filter")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
            }
            .padding(.horizontal)
            HStack(spacing: 16) {
                Image("me")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text("What's on your mind? ")
                Spacer()
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.green)
            }
            .padding(.horizontal)
            Color(.systemGray6)
                .frame(height: 70)
                .overlay {
                    HStack {
                        ReelReusableView(title: "Reel", imageName: "play.rectangle.fill")
                        ReelReusableView(title: "Live", imageName: "video.fill")
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            Button(action: {}, label: {
                HStack(spacing: 10) {
                    Image(systemName: "text.bubble.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 16, height: 16)
                    Text("Manage posts")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                .foregroundStyle(Color(.darkGray))
                .frame(width: width - 30, height: 44)
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.vertical)
            })
            DividerView(width: width)
        }
    }
}

