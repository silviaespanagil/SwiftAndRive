//
//  ContentView.swift
//  AnimationsRive
//
//  Created by Silvia España Gil on 4/4/24.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    
    @State var isMenuOpen = false
    
    let menuButton = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    var body: some View {

        ZStack {
            Group {
                switch selectedTab {
                    
                case .chat:
                    HomeView()
                case .search:
                    Text("search")
                case .timer:
                    Text("timer")
                case .bell:
                    Text("bell")
                case .user:
                    Text("user")
                }
            }.safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 120)
            }
            .ignoresSafeArea()
            
            menuButtonView
            
            TabBar()
        }
    }
    
    @ViewBuilder
    var menuButtonView: some View {
        
        menuButton.view()            
            .frame(width: 54, height: 54)
            .mask(Circle())
            .shadow(color: Color("Shadow").opacity(0.2),
                    radius: 5, x: 0, y: 5)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .onTapGesture {
                isMenuOpen.toggle()
                menuButton.setInput("isOpen", value: isMenuOpen)
            }
    }
}

#Preview {
    ContentView()
}
