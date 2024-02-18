//
//  ProfileHeaderView.swift
//  FacebookClone
//
//  Created by Macbook on 18/2/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    private let width: CGFloat
    
    init(width: CGFloat) {
        self.width = width
    }
    
    var body: some View {
        VStack {
            Image("bruce") // should be exchange to assets image
                .resizable()
                .scaledToFill()
                .frame(width: width, height: 250)
            Color.white
                .frame(height: 100)
        }
        .overlay {
            VStack(alignment: .leading) {
                Image("me")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(Color(.systemGray6) ,lineWidth: 3)
                    }
                    .padding(.top, 170)
                Text("Cardinal 312")
                    .font(.title)
                    .fontWeight(.bold)
                Text("4 ")
                    .font(.headline) +
                Text("Friends")
                    .font(.headline)
                    .foregroundColor(.gray)
                HStack {
                    CustomButton(imageName: "plus", title: "Add to story", backgroundColor: .blue, forgroundColor: .white)
                    CustomButton(imageName: "pencil", title: "Edit profile", backgroundColor: Color(.systemGray5), forgroundColor: Color(.darkGray))
                    CustomButton(imageName: "ellipsis", title: "", backgroundColor: Color(.systemGray5), forgroundColor: Color(.darkGray))
                    
                }
                HStack { Spacer() }
            }
            .padding(.horizontal)
        }
    }
}

