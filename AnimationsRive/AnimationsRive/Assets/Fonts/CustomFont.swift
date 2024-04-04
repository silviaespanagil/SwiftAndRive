//
//  CustomFont.swift
//  AnimationsRive
//
//  Created by Silvia España Gil on 4/4/24.
//

import SwiftUI

struct CustomFont: ViewModifier {
    
    var textStyle: TextStyle
    
    func body (content: Content) -> some View {
        
        content.font(.custom(textStyle.name, size: textStyle.size, relativeTo: textStyle.relative))
    }
}

extension View {
    
    func customFont(_ textStyle: TextStyle) -> some View {
        
        modifier(CustomFont(textStyle: textStyle))
    }
}
