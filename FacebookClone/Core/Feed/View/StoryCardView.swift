//
//  StoryCardView.swift
//  FacebookClone
//
//  Created by Macbook on 15/2/24.
//

import SwiftUI

struct StoryCardView: View {
    @StateObject private var viewModel: FeedViewModel
    private var index: Int
    
    init(viewModel: FeedViewModel, index: Int) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
    }
    
    var body: some View {
        Image(viewModel.friends[index].coverImageName ?? "")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 170)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay {
                VStack(alignment: .leading) {
                    Image(viewModel.friends[index].profileImageName ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .cornerRadius(.infinity)
                        .overlay {
                            Circle()
                                .stroke(.blue, lineWidth: 3)
                        }
                    Spacer()
                    Text("\(viewModel.friends[index].firstName) \(viewModel.friends[index].familyName)")
                        .foregroundStyle(.white)
                        .font(.system(size: 12, weight: .semibold))
                    HStack { Spacer() }
                }
                .padding(.leading, 8)
                .padding(.vertical, 8)
            }
    }
}

struct StoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        StoryCardView(viewModel: FeedViewModel(), index: 0)
    }
}
