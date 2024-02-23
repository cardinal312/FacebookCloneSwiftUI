//
//  MenuView.swift
//  FacebookClone
//
//  Created by Macbook on 23/2/24.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ScrollView {
                    VStack(alignment: .leading) {
                        MenuHeaderView()
                        ShortCutsView(width: proxy.size.width)
                        
                    }
                }
                .background(Color(.systemGray6))
                .scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Menu")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 24) {
                            Image(systemName: "gearshape.fill")
                            Image(systemName: "magnifyingglass")
                        }
                        .fontWeight(.bold)
                    }
                }
            }
        }
    }
    
    struct MenuView_Previews: PreviewProvider {
        static var previews: some View {
            MenuView()
        }
    }
}
