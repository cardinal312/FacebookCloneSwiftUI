//
//  AddPasswordView.swift
//  FacebookClone
//
//  Created by Macbook on 25/2/24.
//

import SwiftUI

struct AddPasswordView: View {
    @Environment(\.dismiss) var dissmiss
    @StateObject private var viewModel: RegistationViewModel
    
    init(viewModel: RegistationViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 20) {
                Text("Create password")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("Create a password whith at least 6 letters or numbers. It should be something that others can't guess")
                    .font(.footnote)
                SecureField("Password", text: $viewModel.password)
                    .customTextFieldViewModifier(width: proxy.size.width + 5)
                NavigationLink {
                    AgreementView(viewModel: viewModel)
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Next")
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
                        .onTapGesture {
                            print("gesture tapped")
                        }
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

struct AddPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        AddPasswordView(viewModel: RegistationViewModel())
    }
}
