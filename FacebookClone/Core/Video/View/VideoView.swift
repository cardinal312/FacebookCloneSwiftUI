//
//  VideoView.swift
//  FacebookClone
//
//  Created by Macbook on 24/2/24.
//

import SwiftUI

struct VideoView: View {
    @StateObject private var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VideoOptionsView()
                ForEach(0 ..< viewModel.videoPosts.count, id: \.self) { index in
                    PostView(isVideo: true, viewModel: viewModel, index: index)
                }
            }
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Video")
                        .font(.title)
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Image(systemName: "person.fill")
                        Image(systemName: "magnifyingglass")
                    }
                    .fontWeight(.bold)
                }
            }
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
