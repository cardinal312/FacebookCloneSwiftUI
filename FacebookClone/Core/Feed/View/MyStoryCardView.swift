//
//  StoryView.swift
//  FacebookClone
//
//  Created by Macbook on 15/2/24.
//

import SwiftUI

struct MyStoryCardView: View {
    @StateObject private var viewModel: FeedViewModel
    init(viewModel: FeedViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color(.systemGray4))
                .frame(width: 100, height: 170)
            Image(viewModel.users[0].profileImageName ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(spacing: 5) {
                Spacer()
                    .frame(height: 90)
                Image(systemName: "plus")
                    .padding(5)
                    .background(.blue)
                    .clipShape(Circle())
                    .foregroundStyle(Color(.white))
                    .font(.system(size: 20, weight: .bold))
                    .overlay {
                        Circle()
                            .stroke(Color(.systemGray6),lineWidth: 3)
                    }
                VStack(spacing: 0) {
                    Text("Create")
                    Text("Story")
                }
                .font(.system(size: 12, weight: .bold))
                
            }
                
        }
        .padding(.leading)
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        MyStoryCardView(viewModel: FeedViewModel())
    }
}
