//
//  AddNameView.swift
//  FacebookClone
//
//  Created by Macbook on 25/2/24.
//

import SwiftUI

struct AddNameView: View {
    @Environment(\.dismiss) var dissmiss
    @StateObject private var viewModel = RegistationViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 20) {
                Text("What's your name?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("Enter the name you use in real life")
                    .font(.footnote)
                HStack {
                    TextField("First name", text: $viewModel.firstName)
                        .customTextFieldViewModifier(width: (proxy.size.width / 2) + 5)
                    Spacer()
                    TextField("Surename", text: $viewModel.familyName)
                        .customTextFieldViewModifier(width: (proxy.size.width / 2) + 5)
                }
                NavigationLink {
                    Text("Age")
                } label: {
                    Text("Log In")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: proxy.size.width - 25, height: 44)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.vertical)
                }
                Spacer()
                HStack {
                    Spacer()
                    Text("Already have an account?")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                    Spacer()
                }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "arrow.backward")
                        .imageScale(.large)
                        .onTapGesture {
                            dissmiss()
                        }
                }
            }
            .background(Color(.systemGray5))
        }
    }
}

struct AddNameView_Previews: PreviewProvider {
    static var previews: some View {
        AddNameView()
    }
}
