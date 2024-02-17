//
//  StoryCardView.swift
//  FacebookClone
//
//  Created by Macbook on 15/2/24.
//

import SwiftUI

struct StoryCardView: View {
    var body: some View {
        Image("madara")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 170)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay {
                VStack(alignment: .leading) {
                    Image("me")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .cornerRadius(.infinity)
                        .overlay {
                            Circle()
                                .stroke(.blue, lineWidth: 3)
                        }
                    Spacer()
                    Text("Jim Halpert")
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
        StoryCardView()
    }
}
