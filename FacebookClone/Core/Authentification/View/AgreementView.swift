//
//  AgreementView.swift
//  FacebookClone
//
//  Created by Macbook on 25/2/24.
//

import SwiftUI

struct AgreementView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { proxy in
        VStack(alignment: .leading, spacing: 20) {
            Text("Agree to facebook's terms and policies")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("People who use our service may have uploaded your contact information to Facebook. ")
                .font(.caption) +
            Text("Learn more")
                .font(.caption)
                .foregroundColor(.blue)
            Text("By tapping ")
                .font(.caption) +
            Text("I agree")
                .font(.caption)
                .fontWeight(.bold) +
            Text(", you agree to create an account and to Facebook's ")
                .font(.caption) +
            Text("terms, Privacy Policy ")
                .font(.caption)
                .foregroundColor(.blue) +
            Text(" and ")
                .font(.caption) +
            Text("Cookies Policy")
                .font(.caption)
                .foregroundColor(.blue)
            Text("The ")
                .font(.caption) +
            Text("Privacy Policy ")
                .font(.caption)
                .foregroundColor(.blue) +
            Text("describes the way we can use the information we callect when you create an account. For example, we use this information to provide, personalise and improve our products, including ads.")
                .font(.caption)
            Button {
                
            } label: {
                Text("I Agree")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: proxy.size.width - 30, height: 44)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(.top)
            }
            Spacer()
            HStack {
                Spacer()
                Text("Already have an account?")
                    .foregroundStyle(.blue)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
            }
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "arrow.backward")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        .background(Color(.systemGray5))
    }
    }
}

struct AgreementView_Previews: PreviewProvider {
    static var previews: some View {
        AgreementView()
    }
}
