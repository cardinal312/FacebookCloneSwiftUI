//
//  StoryFeedView.swift
//  FacebookClone
//
//  Created by Macbook on 15/2/24.
//

import SwiftUI

struct StoryFeedView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                MyStoryCardView()
                ForEach(0..<9) { _ in
                    StoryCardView()
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.vertical, 5)
    }
}

struct StoryFeedView_Previews: PreviewProvider {
    static var previews: some View {
        StoryFeedView()
    }
}
