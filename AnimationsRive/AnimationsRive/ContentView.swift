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
            
            switch selectedTab {
            case .chat:
                Text("chat")
            case .search:
                Text("search")
            case .timer:
                Text("timer")
            case .bell:
                Text("bell")
            case .user:
                Text("user")
            }
            
            menuButtonView
            
            TabBar()
        }
    }
    
    @ViewBuilder
    var menuButtonView: some View {
        
        menuButton.view()            .frame(width: 54, height: 54)
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
