//
//  VideoOptionViewModifier.swift
//  FacebookClone
//
//  Created by Macbook on 24/2/24.
//

import SwiftUI

struct VideoOptionViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundStyle(Color(.darkGray))
    }
}

extension View {
    
    func videoOptionViewModifier() -> some View {
        modifier(VideoOptionViewModifier())
    }
}
