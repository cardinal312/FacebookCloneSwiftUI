//
//  MarketPlaceView.swift
//  FacebookClone
//
//  Created by Macbook on 22/2/24.
//

import SwiftUI

struct MarketPlaceView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    HStack {
                        MarketPlaceButton(title: "Sell", imageName: "square.and.pencil", width: proxy.size.width)
                        MarketPlaceButton(title: "Categories", imageName: "list.bullet", width: proxy.size.width)
                    }
                    .padding()
                    Divider()
                    VStack(alignment: .leading) {
                        HStack(spacing: 2) {
                            Text("Today's picks")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Spacer()
                            Image("pin")
                                .resizable()
                                .frame(width: 20, height: 16)
                            Text("London")
                                .font(.subheadline)
                                .foregroundStyle(.blue)
                        }
                        .padding()
                        LazyVGrid(columns: gridItems,spacing: 1) {
                            ForEach(0 ..< 6) { _ in
                                VStack {
                                    Image("appartment1")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (proxy.size.width / 2) - 3, height: (proxy.size.width / 2) - 3)
                                        .clipped()
                                    Text("950$ - 1 bathroom")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .padding(.vertical)
                                }
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("MarketPlace")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 24) {
                            Image(systemName: "person.fill")
                            Image(systemName: "magnifyingglass")
                        }
                        .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

struct MarketPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        MarketPlaceView()
    }
}
