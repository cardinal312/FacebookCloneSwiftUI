//
//  FriendsView.swift
//  FacebookClone
//
//  Created by Macbook on 21/2/24.
//

import SwiftUI

struct FriendsView: View {
    @StateObject var viewModel = FriendViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    HStack {
                        TagView(title: "suggestions")
                        TagView(title: "Your friends")
                        Spacer()
                    }
                    .padding(.horizontal)
                    Divider()
                    HStack {
                        Text("Friends requests")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("\(viewModel.friendsRequests.count)")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.red)
                        Spacer()
                        Button(action: {}, label: {
                            Text("See all")
                        })
                    }
                    .padding(.horizontal)
                    ForEach(0 ..< viewModel.friendsRequests.count) { index in
                        FriendCell(viewModel: viewModel, index: index)
                    }
                    Spacer()
                }
                .padding(.vertical)
            }
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Friends")
                        .font(.title)
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "magnifyingglass")
                        .fontWeight(.bold)
                }
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
