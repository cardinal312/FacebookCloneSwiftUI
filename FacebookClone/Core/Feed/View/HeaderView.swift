//
//  HeaderView.swift
//  FacebookClone
//
//  Created by Macbook on 14/2/24.
//

import SwiftUI
import Kingfisher

struct HeaderView: View {
    @State private var showCreatePost: Bool = false
    @StateObject private var viewModel: FeedViewModel
    
    init(viewModel: FeedViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        HStack {
            NavigationLink {
                ProfileView(viewModel: viewModel)
                    .navigationBarBackButtonHidden()
            } label: {
                ZStack {
                    Image(.noProfile)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    KFImage(URL(string: viewModel.currenUser?.profileImageName ?? ""))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                Button(action: {
                    showCreatePost.toggle()
                }, label: {
                    HStack {
                        Text("What's on your mind?")
                            .foregroundStyle(.black)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .overlay {
                        Capsule()
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    }
                    .padding(.leading, 5)
                    .padding(.trailing, 15)
                })
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.green)
            }
            .padding(.horizontal)
            .padding(.top, 30)
            .padding(.bottom)
            .fullScreenCover(isPresented: $showCreatePost, content: {
                CreatePostView(viewModel: viewModel)
            })
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(viewModel: FeedViewModel())
    }
}
