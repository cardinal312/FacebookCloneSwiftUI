//
//  CreatePostView.swift
//  FacebookClone
//
//  Created by Macbook on 20/2/24.
//

import SwiftUI
import Kingfisher
import AVKit
import PhotosUI

struct CreatePostView: View {
    @Environment(\.dismiss) private var dissmis
    @StateObject private var viewModel: FeedViewModel
    
    init(viewModel: FeedViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack(alignment: .leading) {
                    Divider()
                    HStack(alignment: .top) {
                        ZStack {
                            Image(.noProfile)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                                .padding(.leading, 7)
                            KFImage(URL(string: viewModel.currenUser?.profileImageName ?? ""))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                                .padding(.leading, 7)
                        }
                        VStack(alignment: .leading) {
                            Text("\(viewModel.currenUser?.firstName ?? "") \(viewModel.currenUser?.familyName ?? "")")
                            HStack {
                                ChoiceView(iconName: "person.2.fill", iconText: "Friends")
                                ChoiceView(iconName: "", iconText: "Album")
                            }
                            ChoiceView(iconName: "camera", iconText: "Off")
                        }
                        .padding(.horizontal, 12)
                    }
                    .padding()
                    TextField("What's on your mind?", text: $viewModel.mindText, axis: .vertical)
                        .padding(.horizontal)
                    ZStack {
                        viewModel.creaPostImage?
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width - 30, height: 300)
                            .clipped()
                            .padding(.leading)
                            .padding(.top)
                        if let createdVideoUrl = viewModel.createdVideoUrl {
                            VideoPlayer(player: AVPlayer(url: createdVideoUrl))
                                .frame(width: proxy.size.width - 30, height: 300)
                                .scaledToFill()
                                .padding(.leading)
                                .padding(.top)
                        }
                    }
                    Spacer()
                    Divider()
                    HStack(spacing: 50) {
                        Spacer()
                        Button(action: {
                            viewModel.showCreatePostPicker.toggle()
                        }, label: {
                            Image(systemName: "photo.fill.on.rectangle.fill")
                                .foregroundStyle(.green)
                        })
                        Button(action: {}, label: {
                            Image(systemName: "person.fill")
                                .foregroundStyle(.blue)
                        })
                        Button(action: {}, label: {
                            Image(systemName: "face.smiling")
                                .foregroundStyle(.yellow)
                        })
                        Button(action: {}, label: {
                            Image("pin")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundStyle(.red)
                        })
                        PhotosPicker(selection: $viewModel.selectedVideo, matching: .any(of: [.videos, .not(.images)])) {
                            Image(systemName: "ellipsis.circle.fill")
                                .foregroundStyle(Color(.darkGray))
                        }
                        Spacer()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack {
                            Button(action: {
                                if let createdVideoUrl = viewModel.createdVideoUrl {
                                    viewModel.cleanupTemporaryFile(url: createdVideoUrl)
                                }
                                dissmis()
                            }, label: {
                                Image(systemName: "arrow.left")
                                    .foregroundStyle(.black)
                                    .fontWeight(.bold)
                            })
                            Text("Create Post")
                                .fontWeight(.semibold)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            Task {
                                try await viewModel.uploadPost()
                                viewModel.mindText = ""
                                viewModel.creaPostImage = nil
                                viewModel.creaPostImage = nil
                                dissmis()
                            }
                        }, label: {
                            Text("Post")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 80, height: 35)
                                .foregroundStyle(viewModel.mindText.count == 0 ? Color(.darkGray) : .white)
                                .background(viewModel.mindText.count == 0 ? Color(.systemGray5) : .blue)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        })
                        .disabled(viewModel.mindText.count == 0)
                    }
                }
            }
            .photosPicker(isPresented: $viewModel.showCreatePostPicker, selection: $viewModel.selectedCreatePostImage)
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView(viewModel: FeedViewModel())
    }
}
