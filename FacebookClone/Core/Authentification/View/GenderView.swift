//
//  GenderView.swift
//  FacebookClone
//
//  Created by Macbook on 25/2/24.
//

import SwiftUI

struct GenderView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: RegistationViewModel
    
    init(viewModel: RegistationViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 20) {
                Text("What's your gender?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("You can change who sees your gender on your profile later")
                    .font(.footnote)
                VStack(alignment: .leading, spacing: 24) {
                    ForEach(viewModel.genderChoices, id: \.self) { choice in
                        Button {
                            viewModel.gender = choice
                        } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(choice)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                    if choice == "More options" {
                                        Text("Selected more options to choose another gender or if you'd rather not say")
                                            .font(.subheadline)
                                            .foregroundStyle(Color(.darkGray))
                                            .padding(.trailing)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                                Spacer()
                                Circle()
                                    .stroke(viewModel.gender == choice ? .blue : .gray, lineWidth: 1)
                                    .frame(width: 25, height: 25)
                                    .overlay {
                                        Circle()
                                            .frame(width: 15, height: 15)
                                            .foregroundStyle(viewModel.gender == choice ? .blue : .clear)
                                    }
                            }
                        }
                        
                    }
                }
                .padding(20)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                NavigationLink {
                    AddEmailView(viewModel: viewModel)
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Next")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: proxy.size.width - 30, height: 44)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.top)
                }
                Spacer()
                HStack {
                    Spacer()
                    Text("Already have an account")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "arrow.backward")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
            .padding()
            .background(Color(.systemGray5))
        }
    }
}

struct GenderView_Previews: PreviewProvider {
    static var previews: some View {
        GenderView(viewModel: RegistationViewModel())
    }
}
