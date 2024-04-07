//
//  ProfileView.swift
//  FacebookClone
//
//  Created by Macbook on 14/2/24.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: FeedViewModel
    
    init(viewModel: FeedViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    ProfileHeaderView(width: proxy.size.width, viewModel: viewModel)
                    DividerView(width: proxy.size.width)
                        .padding(.top, 30)
                    ProfileOptionsView()
                    ProfileFriendsView(width: proxy.size.width, viewModel: viewModel)
                    DividerView(width: proxy.size.width)
                    ManageProfilePostsView(width: proxy.size.width)
                    ForEach(0..<viewModel.myPostIndexes.count) { index in
                        PostView(isVideo: false, viewModel: viewModel, index: viewModel.myPostIndexes[index])
                    }
                }
                .scrollIndicators(.hidden)
                .navigationTitle("\(viewModel.currenUser?.firstName ?? "") \(viewModel.currenUser?.familyName ?? "")")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                        })
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {}, label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                        })
                    }
                }
            }
        }
    }
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView(viewModel: FeedViewModel())
        }
    }
}

