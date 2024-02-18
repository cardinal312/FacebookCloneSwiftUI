//
//  ProfileFriendsView.swift
//  FacebookClone
//
//  Created by Macbook on 18/2/24.
//

import SwiftUI

struct ProfileFriendsView: View {
    
    private let width: CGFloat
    init(width: CGFloat) {
        self.width = width
    }
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Friends")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text("4 friends")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                Spacer()
                Text("Find friends")
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
            }
            .padding(.horizontal)
            
            LazyVGrid(columns: gridItems) {
                ForEach(0 ..< 4) { _ in
                    VStack {
                        Image("team")
                            .resizable()
                            .scaledToFill()
                            .frame(width: (width / 3) - 20, height: (width / 3) - 20 )
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        Text("Jim Helpert")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                }
            }
            Text("See all friends")
                .font(.headline)
                .fontWeight(.semibold)
                .frame(width: width - 30, height: 44)
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.vertical)
                .foregroundStyle(Color(.darkGray))
        }
        .padding(.horizontal)
    }
}

