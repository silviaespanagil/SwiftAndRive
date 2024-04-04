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
            
            VStack(alignment: .leading, spacing: 16) {
                
                Spacer().frame(height: 40)
                
                titleArea
                
                Spacer()
                
                enterButton
                
                captionText
                
                Spacer().frame(height: 16)
            }
        }
    }
    
    @ViewBuilder
    var background: some View {
        
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
    }
    
    @ViewBuilder
    var titleArea: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Learn design & code")
                .font(.custom("Poppins Bold", size: 60, relativeTo: .largeTitle))
                .frame(width: 260, alignment: .leading)
            
            Text("Don't skip design. Learn designing and code, by building real apps. Complete courses using the latests tools")
                .customFont(.body)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
        }.padding(.horizontal, 16)
    }
    
    @ViewBuilder
    var enterButton: some View {
        
        button.view()
            .frame(width: 235, height: 54)
            .overlay(
            Label("Start the course", systemImage: "arrow.forward")
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
    
    @ViewBuilder
    var captionText: some View {
        
        Text("All purchases include access to the courses and premium tutorials.")
            .customFont(.footnote)
            .opacity(0.7)
            .padding(.horizontal, 16)
    }
}

#Preview {
    OnboardingView()
}
