//
//  CustomTextField.swift
//  AnimationsRive
//
//  Created by Silvia España Gil on 5/4/24.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    
    var iconImage: String
    
    func body(content: Content) -> some View {
        
        content
            .padding(16)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke()
                    .fill(.black.opacity(0.1)))
            .overlay(
                Image(iconImage)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10))
    }
}

extension View {
    
    func customTextField(iconImage: String = "") -> some View {
        modifier(CustomTextField(iconImage: iconImage))
    }
}
