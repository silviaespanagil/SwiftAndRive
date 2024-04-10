//
//  ContentView.swift
//  AnimationsRive
//
//  Created by Silvia España Gil on 4/4/24.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
    @State var isMenuOpen = false
    @State var showOnboarding = false
    
    let menuButton = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    var body: some View {

        ZStack {
            
            Color("Background 2").ignoresSafeArea()
            
            SideMenu()
                .opacity(isMenuOpen ? 1 : 0)
                .offset(x: isMenuOpen ? 0 : -300)
                .rotation3DEffect(.degrees(isMenuOpen ? 0 : 30), axis: (x: 0, y: 1, z: 0))
                
            tabBarNavigation
            
            menuButtonView
            
            TabBar()
                .offset(y: isMenuOpen ? 300 : 0)
                .offset(y: showOnboarding ? 200 : 0)
            
            personButton
        }
    }
    
    @ViewBuilder
    var menuButtonView: some View {
        
        menuButton.view()            
            .frame(width: 45, height: 45)
            .mask(Circle())
            .shadow(color: Color("Shadow").opacity(0.2),
                    radius: 5, x: 0, y: 5)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .offset(x: isMenuOpen ? 216 : 0)
            .onTapGesture {
                menuButton.setInput("isOpen", value: isMenuOpen)
                
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                    isMenuOpen.toggle()
                }
            }
    }
    
    @ViewBuilder
    var personButton: some View {
        
        Image(systemName: "person")
            .frame(width: 36, height: 36)
            .background(.white)
            .mask(Circle())
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
            .padding()
            .offset(y: 4)
            .offset(x: isMenuOpen ? 100 : 0)
            .onTapGesture {
                withAnimation(.spring()) {
                    showOnboarding.toggle()
                }
            }
        
        if showOnboarding {
            OnboardingView(show: $showOnboarding)
                .background(.white)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.5), radius: 40, x: 0, y: 40)
                .ignoresSafeArea(.all, edges: .top)
                .offset(y: showOnboarding ? -10 : 0)
                .zIndex(1)
                .transition(.move(edge: .top))
        }
    }
    
    @ViewBuilder
    var tabBarNavigation: some View {
        
        Group {
            switch selectedTab {
                
            case .home:
                HomeView()
                    .background(.white)
            case .search:
                Text("search")
            case .timer:
                Text("timer")
            case .bell:
                Text("bell")
            case .user:
                Text("user")
            }
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 80)
        }
        .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 120)
        }
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .rotation3DEffect(.degrees(isMenuOpen ? 30 : 0), axis: (x: 0, y: -1, z: 0))
        .offset(x: isMenuOpen ? 265 : 0)
        .scaleEffect(isMenuOpen ? 0.9 : 1)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
