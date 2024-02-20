//
//  HeaderView.swift
//  FacebookClone
//
//  Created by Macbook on 14/2/24.
//

import SwiftUI

struct HeaderView: View {
    @State private var showCreatePost: Bool = false
    
    var body: some View {
        HStack {
            NavigationLink {
                ProfileView()
                    .navigationBarBackButtonHidden()
            } label: {
                Image("me")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Button(action: {
                    showCreatePost.toggle()
                }, label: {
                    HStack {
                        Text("What's on your mind?")
                            .foregroundStyle(.black)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .overlay {
                        Capsule()
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    }
                    .padding(.leading, 5)
                    .padding(.trailing, 15)
                })
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.green)
            }
            .padding(.horizontal)
            .padding(.top, 30)
            .padding(.bottom)
            .fullScreenCover(isPresented: $showCreatePost, content: {
                CreatePostView()
            })
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
