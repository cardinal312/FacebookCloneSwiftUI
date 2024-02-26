//
//  AddEmailView.swift
//  FacebookClone
//
//  Created by Macbook on 25/2/24.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dissmiss
    @StateObject private var viewModel: RegistationViewModel
    
    init(viewModel: RegistationViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 20) {
                Text("What's your email adress?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("Enter the email adress at which you can be contacted. No one will see this on your profile")
                    .font(.footnote)
                    .fontWeight(.semibold)
                TextField("Email adress", text: $viewModel.email)
                        .customTextFieldViewModifier(width: proxy.size.width + 5)
                        .textInputAutocapitalization(.never)
                        .textContentType(.emailAddress)
                Text("You'll recieve email from us and can opt out anytime ")
                    .font(.caption) +
                Text("Learn more")
                    .font(.caption)
                    .foregroundColor(.blue)
                VStack {
                    NavigationLink {
                        AddPasswordView(viewModel: viewModel)
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
                    Text("Sign up with Mobile Number")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: proxy.size.width - 25, height: 44)
                        .background(.white)
                        .foregroundStyle(Color(.darkGray))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
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


struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView(viewModel: RegistationViewModel())
    }
}
