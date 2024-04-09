//
//  HorizontalCard.swift
//  AnimationsRive
//
//  Created by Silvia España Gil on 9/4/24.
//

import SwiftUI

struct HorizontalCard: View {
    
    var section = courseSections[0]
    
    var body: some View {
        
        HStack(spacing: 20) {
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(section.title)
                    .customFont(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(section.caption)
                    .customFont(.body)
            }
            
            Divider()
            
            section.image
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: 110)
        .foregroundColor(.white)
        .background(section.color)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

#Preview {
    HorizontalCard()
}
