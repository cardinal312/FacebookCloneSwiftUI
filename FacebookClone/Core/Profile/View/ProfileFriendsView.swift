//
//  ProfileFriendsView.swift
//  FacebookClone
//
//  Created by Macbook on 18/2/24.
//

import SwiftUI
import Kingfisher

struct ProfileFriendsView: View {
    
    private let width: CGFloat
    @StateObject private var viewModel: FeedViewModel
    
    init(width: CGFloat, viewModel: FeedViewModel) {
        self.width = width
        self._viewModel = StateObject(wrappedValue: viewModel)
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
                    Text("\(viewModel.friends.count) friends")
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
                ForEach(viewModel.friends) { friend in
                    VStack {
                        ZStack() {
                            Image(.noProfile)
                                .resizable()
                                .scaledToFill()
                                .frame(width: (width / 3) - 20, height: (width / 3) - 20 )
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            KFImage(URL(string: friend.profileImageName ?? ""))
                                .resizable()
                                .scaledToFill()
                                .frame(width: (width / 3) - 20, height: (width / 3) - 20 )
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        Text("\(friend.firstName) \(friend.familyName)")
                            .font(.subheadline)
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

