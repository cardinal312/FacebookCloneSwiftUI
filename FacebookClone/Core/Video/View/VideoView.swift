//
//  VideoView.swift
//  FacebookClone
//
//  Created by Macbook on 24/2/24.
//

import SwiftUI

struct VideoView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VideoOptionsView()
                ForEach(0 ..< 3) { _ in
                    PostView(isVideo: true)
                }
            }
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Video")
                        .font(.title)
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Image(systemName: "person.fill")
                        Image(systemName: "magnifyingglass")
                    }
                    .fontWeight(.bold)
                }
            }
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
