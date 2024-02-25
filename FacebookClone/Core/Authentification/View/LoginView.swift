//
//  LoginView.swift
//  FacebookClone
//
//  Created by Macbook on 25/2/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack(spacing: 70) {
                    Spacer()
                    Image("fb_circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                    VStack(spacing: 24) {
                        TextField("Mobile number or email adress", text: $viewModel.email)
                            .textInputAutocapitalization(.never)
                            .customTextFieldViewModifier(width: proxy.size.width)
                        SecureField("Password", text: $viewModel.password)
                            .customTextFieldViewModifier(width: proxy.size.width)
                        Button {
                            print(#function)
                        } label: {
                            Text("Log In")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: proxy.size.width - 30, height: 44)
                                .background(.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                        Text("Forgot Password?")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    HStack { Spacer() }
                    Spacer()
                    VStack(spacing: 24) {
                            NavigationLink {
                                AddNameView()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Text("Create new account?")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .frame(width: proxy.size.width - 30, height: 44)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(.blue, lineWidth: 1)
                                    }
                            }
                        HStack(spacing: 5) {
                            Image("meta_icon")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 16, height: 16)
                            Text("Meta")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                        .foregroundStyle(Color(.darkGray))
                    }
                }
                .background(Color(.systemGray5))
            }
        }
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
