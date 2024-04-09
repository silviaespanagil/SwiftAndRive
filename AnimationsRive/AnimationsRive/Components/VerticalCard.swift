//
//  VerticalCard.swift
//  AnimationsRive
//
//  Created by Silvia España Gil on 9/4/24.
//

import SwiftUI

struct VerticalCard: View {
    
    var course: Course
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text(course.title)
                .customFont(.title2)
                .frame(maxWidth: 170, alignment: .leading)
                .layoutPriority(1)
            
            Text(course.subtitle)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(course.caption.uppercased())
                .customFont(.footnote2)
                .opacity(0.7)
            
            Spacer()
            
            HStack {
                
                ForEach(Array([4, 5, 6].shuffled().enumerated()), id: \.offset) { index, number in
                    
                    Image("Avatar \(number)")
                        .resizable()
                        .mask(Circle())
                        .frame(width: 44, height: 44)
                        .scaledToFill()
                        .offset(x: CGFloat(index * -20))
                }
            }
        }
        .foregroundColor(.white)
        .padding(30)
        .frame(width: 260, height: 310)
        .background(.linearGradient(colors: [course.color.opacity(1), course.color.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: course.color.opacity(0.3), radius: 8, x: 0, y: 12)
        .shadow(color: course.color.opacity(0.3), radius: 2, x: 0, y: 1)
        .overlay(
            course.image
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(20)
        )
    }
}

#Preview {
    VerticalCard(course: courses[1])
}
