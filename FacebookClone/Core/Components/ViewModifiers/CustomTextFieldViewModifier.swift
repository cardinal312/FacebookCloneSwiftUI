//
//  CustomTextFieldViewModifier.swift
//  FacebookClone
//
//  Created by Macbook on 25/2/24.
//

import SwiftUI

struct CustomTextFieldViewModifier: ViewModifier {
    private let width: CGFloat
    
    init(width: CGFloat) {
        self.width = width
    }
    
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(.white)
            .frame(width: width - 30, height: 44)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    
    func customTextFieldViewModifier(width: CGFloat) -> some View {
        modifier(CustomTextFieldViewModifier(width: width))
    }
}
