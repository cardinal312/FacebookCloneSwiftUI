//
//  MenuView.swift
//  FacebookClone
//
//  Created by Macbook on 23/2/24.
//

import SwiftUI

struct MenuView: View {
    @State private var showLogoutAlert: Bool = false
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ScrollView {
                    VStack(alignment: .leading) {
                        MenuHeaderView()
                        ShortCutsView(width: proxy.size.width)
                        MenuCell(iconName: "questionmark.circle.fill", titleText: "Help & Support")
                        MenuCell(iconName: "gearshape.fill", titleText: "Settings & privacy")
                        MenuCell(iconName: "window.casement.closed", titleText: "Also from Meta")
                        Button {
                            showLogoutAlert.toggle()
                            
                        } label: {
                            Text("Log Out")
                                .customButtonModifier(width: proxy.size.width)
                                .padding()
                        }
                    }
                }
                .alert("Logout of your account?", isPresented: $showLogoutAlert, actions: {
                    HStack {
                        Button("Logout") {}
                        Button("Cancel") {}
                    }
                })
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
