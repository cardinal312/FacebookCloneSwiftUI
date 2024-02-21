//
//  FriendsView.swift
//  FacebookClone
//
//  Created by Macbook on 21/2/24.
//

import SwiftUI

struct FriendsView: View {
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
                        Text("3")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.red)
                        Spacer()
                        Button(action: {}, label: {
                            Text("See all")
                        })
                    }
                    .padding(.horizontal)
                    ForEach(0..<3) { _ in
                        FriendCell()
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
