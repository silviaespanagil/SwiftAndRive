//
//  OnboardingView.swift
//  AnimationsRive
//
//  Created by Silvia España Gil on 4/4/24.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    
    let button = RiveViewModel(fileName: "button")
    
    var body: some View {
        
        ZStack {
            
            background
            
            button.view()
                .frame(width: 235, height: 54)
                .overlay(
                Label("Speak friend", systemImage: "arrow.forward")
                    .offset(x: 4, y: 4)
                    .font(.headline)
                )
                .background(
                    Color.black
                        .cornerRadius(30)
                        .blur(radius: 30)
                        .opacity(0.3)
                        .offset(y: 10)
                )
                .onTapGesture {
                    button.play(animationName: "active")
                }
        }
    }
    
    @ViewBuilder
    var background: some View {
        
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
    }
}

#Preview {
    OnboardingView()
}
