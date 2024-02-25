//
//  AgeView.swift
//  FacebookClone
//
//  Created by Macbook on 25/2/24.
//

import SwiftUI

struct AgeView: View {
    @Environment(\.dismiss) var dissmiss
    @StateObject private var viewModel: RegistationViewModel
    
    init(viewModel: RegistationViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 20) {
                Text("How old are you?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                    TextField("Age", text: $viewModel.age)
                        .customTextFieldViewModifier(width: proxy.size.width + 5)
                VStack {
                    NavigationLink {
                        GenderView(viewModel: viewModel)
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
                    Text("Use date of birth")
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


struct AgeView_Previews: PreviewProvider {
    static var previews: some View {
        AgeView(viewModel: RegistationViewModel())
    }
}
