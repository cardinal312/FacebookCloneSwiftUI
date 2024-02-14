//
//  FeedView.swift
//  FacebookClone
//
//  Created by Macbook on 14/2/24.
//

import SwiftUI

struct FeedView: View {
    private var facebookBlue: Color = Color(red: 26/255, green: 103/255, blue: 178/255)
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView()
                .padding(.horizontal)
                .padding(.vertical, 30)
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


struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
