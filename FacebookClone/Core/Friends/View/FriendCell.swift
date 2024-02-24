//
//  FriendCell.swift
//  FacebookClone
//
//  Created by Macbook on 21/2/24.
//

import SwiftUI

struct FriendCell: View {
    private var viewModel: FriendViewModel
    private var index: Int
    
    init(viewModel: FriendViewModel, index: Int) {
        self.viewModel = viewModel
        self.index = index
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Image(viewModel.friendsRequests[index].profileImageName ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("\(viewModel.friendsRequests[index].firstName) \(viewModel.friendsRequests[index].familyName)")
                    .font(.headline)
                    .fontWeight(.semibold)
                HStack {
                    Button(action: {}, label: {
                        Text("Confirm")
                            .foregroundStyle(.white)
                            .frame(width: 120, height: 32)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    Button(action: {}, label: {
                        Text("Delete")
                            .foregroundStyle(.black)
                            .frame(width: 120, height: 32)
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                }
            }
        }
        .padding(.horizontal)
    }
}

