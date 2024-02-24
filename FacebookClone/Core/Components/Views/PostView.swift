//
//  PostView.swift
//  FacebookClone
//
//  Created by Macbook on 17/2/24.
//

import SwiftUI
import AVKit

struct PostView: View {
    private var isVideo: Bool = false
    @StateObject private var viewModel: FeedViewModel
    private var index: Int
    
    init(isVideo: Bool, viewModel: FeedViewModel, index: Int) {
        self.isVideo = isVideo
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(viewModel.posts[index].user?.profileImageName ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .cornerRadius(.infinity)
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(viewModel.posts[index].user?.firstName ?? "") \(viewModel.posts[index].user?.familyName ?? "")")
                        .font(.system(size: 14, weight: .semibold))
                    HStack(spacing: 5) {
                        Text("1 d")
                        Circle()
                            .frame(width: 2, height: 2)
                            .fontWeight(.bold)
                        Image(systemName: "globe")
                    }
                    .font(.system(size: 12))
                    .foregroundStyle(Helpers.Colors.facebookBlue)
                }
                Spacer()
                HStack(spacing: 24) {
                    Image(systemName: "ellipsis")
                    Image(systemName: "xmark")
                }
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.bold)
            }
            .padding(.horizontal)
            Text(viewModel.posts[index].postTitle)
                .padding(.horizontal)
            if !isVideo {
                Image(viewModel.posts[index].postUrl)
                    .resizable()
                    .scaledToFill()
            } else {
                //MARK: - AVKit Video
                if let url = URL(string: Helpers.VideoUrl.bigBuckBunny) {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(width: 40)
                }
            }
            HStack(spacing: 3) {
                Image(systemName: "hand.thumbsup")
                    .resizable()
                    .frame(width: 18, height: 18)
                Text("5")
                Spacer()
                Text("3 comments")
                Text("‧")
                    .fontWeight(.bold)
                Text("2 shares")
            }
            .padding(.horizontal)
            .font(.system(size: 12))
            .foregroundStyle(Helpers.Colors.facebookBlue)
            Divider()
                .background(.white.opacity(0.5))
            HStack {
                Spacer()
                HStack {
                    Image(systemName: "hand.thumbsup")
                    Text("Like")
                }
                Spacer()
                HStack {
                    Image(systemName: "message")
                    Text("Comment")
                }
                Spacer()
                HStack {
                    Image(systemName: "star") // should be icon change
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Send")
                }
                Spacer()
                HStack {
                    Image(systemName: "arrowshape.turn.up.right")
                    Text("Share")
                }
                Spacer()
            }
            .font(.system(size: 12))
            .foregroundStyle(Helpers.Colors.facebookBlue)
        }
    }
}

