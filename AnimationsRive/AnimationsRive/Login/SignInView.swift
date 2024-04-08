//
//  SignInView.swift
//  AnimationsRive
//
//  Created by Silvia España Gil on 5/4/24.
//

import SwiftUI
import RiveRuntime

struct SignInView: View {
    
    @Binding var showLoginModal: Bool
    
    @State var userEmail = ""
    @State var userPassword = ""
    @State var isLoading = false
    
    let loadingAnimation = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")
    let confettiAnimation = RiveViewModel(fileName: "confetti", stateMachineName: "State Machine 1")
    
    var body: some View {
        
        VStack(spacing: 24) {
            
            headerArea
            
            userInputs
            
            loginButton
            
            signUpArea
        }.padding()
            .background(.regularMaterial)
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
            .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
            .padding(16)
            .overlay(successMark)
            .disabled(isLoading)
    }
    
    @ViewBuilder
    var headerArea: some View {
        
        VStack {
            
            Text("Sign In")
                .customFont(.largeTitle)
            
            Text("Access to 240+ hours of content. Learn design and code, by building real apps with Swift")
                .customFont(.headline)
        }
    }
    
    @ViewBuilder
    var userInputs: some View {
        
        VStack(alignment: .leading) {
            
            Text("Email")
                .customFont(.subheadline)
                .foregroundColor(.secondary)
            
            TextField("", text: $userEmail)
                .padding(.leading, 40)
                .customTextField(iconImage: "Icon Email")
            
            Spacer().frame(height: 24)
            
            Text("Password")
                .customFont(.subheadline)
                .foregroundColor(.secondary)
            
            SecureField("", text: $userPassword)
                .customTextField(iconImage: "Icon Lock")
        }
    }
    
    @ViewBuilder
    var loginButton: some View {
        
        Button {
            setOnLogIn()
        } label: {
            
            Label("Sign in", systemImage: "arrow.right")
                .customFont(.headline)
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(Color(hex: "F77D8E"))
                .foregroundColor(.white)
                .cornerRadius(20, corners: [.topRight, .bottomLeft, .bottomRight])
                .shadow(color:Color(hex: "F77D8E").opacity(0.5), radius: 10, x:0, y: 8)
        }
    }
    
    @ViewBuilder
    var signUpArea: some View {
        
        VStack(spacing: 16) {
            
            HStack {
                Rectangle().frame(height: 1).opacity(0.1)
                Text("OR").customFont(.subheadline2)
                    .foregroundColor(.secondary)
                Rectangle().frame(height: 1).opacity(0.1)
            }
            
            Text("Sign up with Email, Apple or Google")
                .customFont(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                Image("Logo Email")
                Spacer()
                Image("Logo Apple")
                Spacer()
                Image("Logo Google")
            }.padding(.bottom, 16)
        }
    }
    
    @ViewBuilder
    var successMark: some View {
        ZStack {
            if isLoading {
                loadingAnimation.view()
                    .frame(width: 100, height: 100)
                    .allowsHitTesting(false)
            }
            confettiAnimation.view()
                .scaleEffect(3)
                .allowsHitTesting(false)
        }
    }
}

extension SignInView {
    
    func setOnLogIn() {
        
        isLoading = true
        
        if userEmail != "" && userPassword != "" {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                loadingAnimation.triggerInput("Check")
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
                confettiAnimation.triggerInput("Trigger explosion")
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                
                withAnimation {
                    showLoginModal = false
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                loadingAnimation.triggerInput("Error")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                isLoading = false
            }
        }
    }
}

#Preview {
    SignInView(showLoginModal: .constant(true))
}
