//
//  StoryFeedView.swift
//  FacebookClone
//
//  Created by Macbook on 15/2/24.
//

import SwiftUI

struct StoryFeedView: View {
    @StateObject private var viewModel: FeedViewModel
    
    init(viewModel: FeedViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                MyStoryCardView(viewModel: viewModel)
                ForEach(0..<viewModel.friends.count) { index in
                    StoryCardView(viewModel: viewModel, index: index)
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.vertical, 5)
    }
}

struct StoryFeedView_Previews: PreviewProvider {
    static var previews: some View {
        StoryFeedView(viewModel: FeedViewModel())
    }
}
