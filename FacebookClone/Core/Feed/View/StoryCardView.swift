//
//  StoryCardView.swift
//  FacebookClone
//
//  Created by Macbook on 15/2/24.
//

import SwiftUI
import Kingfisher

struct StoryCardView: View {
    @StateObject private var viewModel: FeedViewModel
    private var index: Int
    
    init(viewModel: FeedViewModel, index: Int) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
    }
    
    var body: some View {
        if let friend = viewModel.friends[safe: index] {
            ZStack {
                Image(.noProfile)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 170)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                KFImage(URL(string: friend.coverImageName ?? ""))
                    .resizable()
                    .frame(width: 100, height: 170)
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                .overlay {
                    VStack(alignment: .leading) {
                        ZStack {
                            Image(.noProfile)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 35, height: 35)
                                .clipShape(Circle())
                            KFImage(URL(string: friend.profileImageName ?? ""))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 35, height: 35)
                                .clipShape(Circle())
                        }
                            .overlay {
                                Circle()
                                    .stroke(.blue, lineWidth: 3)
                            }
                        Spacer()
                        Text("\(friend.firstName) \(friend.familyName)")
                            .foregroundStyle(.white)
                            .font(.system(size: 12, weight: .semibold))
                        HStack { Spacer() }
                    }
                    .padding(.leading, 8)
                    .padding(.vertical, 8)
            }
        }
    }
}

struct StoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        StoryCardView(viewModel: FeedViewModel(), index: 0)
    }
}
