//
//  CustomButtonModifier.swift
//  FacebookClone
//
//  Created by Macbook on 24/2/24.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {
    let width:CGFloat
 
    func body(content: Content) -> some View {
        content
        .font(.headline)
        .fontWeight(.semibold)
        .frame(width: width - 30, height: 44)
        .background(Color(.systemGray4))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .foregroundStyle(.black)
        .padding(.vertical)
    }
}

extension View {
    
    func customButtonModifier(width: CGFloat) -> some View {
        modifier(CustomButtonModifier(width: width))
    }
}

