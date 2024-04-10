//
//  OnboardingView.swift
//  AnimationsRive
//
//  Created by Silvia España Gil on 4/4/24.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    
    @Binding var show: Bool
    
    @State var showLoginModal: Bool = false
    
    let button = RiveViewModel(fileName: "button")
    
    var body: some View {
        
        ZStack {
            
            background
            
            content
            
            Color("Shadow")
                .opacity(showLoginModal ? 0.4 : 0)
                .ignoresSafeArea()
            
            if showLoginModal {
                
                signInModalView
            }
        }
    }
    
    @ViewBuilder
    var content: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            Spacer().frame(height: 30)
            
            HStack(alignment: .top) {
                
                titleArea
                
                Spacer()
                
                closeButton
            }
            
            Spacer()
            
            enterButton
            
            captionText
            
            Spacer().frame(height: 16)
        }.opacity(showLoginModal ? 0 : 1)
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
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    withAnimation(.spring()) {
                        
                        showLoginModal = true
                    }
                }
            }
    }
    
    @ViewBuilder
    var captionText: some View {
        
        Text("All purchases include access to the courses and premium tutorials.")
            .customFont(.footnote)
            .opacity(0.7)
            .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    var signInModalView: some View {
        
        SignInView(showLoginModal: $showLoginModal)
            .transition(.move(edge: .top).combined(with: .opacity))
            .overlay(
                Button {
                    withAnimation(.spring()) {
                        showLoginModal = false
                    }
                } label: {
                    Image(systemName: "xmark")
                        .frame(width: 36, height: 36)
                        .foregroundColor(.black)
                        .background(.white)
                        .mask(Circle())
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
                }.frame(maxHeight: .infinity, alignment: .bottom))
    }
    
    @ViewBuilder
    var closeButton: some View {
        
        Button {
            withAnimation {
                show.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .foregroundColor(.white)
                .frame(width: 36, height: 36)
                .background(.black)
                .mask(Circle())
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
        }
        .padding(20)
        .offset(y: showLoginModal ? -200 : 0)
    }
}

#Preview {
    OnboardingView(show: .constant(true))
}
