//
//  FeedView.swift
//  FacebookClone
//
//  Created by Macbook on 14/2/24.
//

import SwiftUI

struct FeedView: View {
    private let facebookBlue = Helpers.Colors.facebookBlue
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    VStack {
                        HeaderView()
                        DividerView(width: proxy.size.width)
                        StoryFeedView()
                        DividerView(width: proxy.size.width)
                        ForEach(0 ..< 3) { _ in
                            PostView()
                        }
                        DividerView(width: proxy.size.width - 15)
                        Spacer()
                        
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("Facebook")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(facebookBlue)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack(spacing: 24) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 24, height: 24)
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 24, height: 24)
                                    .font(.system(size: 18, weight: .bold))
                                Image(systemName: "message")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 24, height: 24)
                            }
                        }
                    }
                }
            }
        }
    }
    
    struct FeedView_Previews: PreviewProvider {
        static var previews: some View {
            FeedView()
        }
    }
}


