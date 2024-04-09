//
//  ContentView.swift
//  AnimationsRive
//
//  Created by Silvia España Gil on 4/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    
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
            TabBar()
        }
    }
}

#Preview {
    ContentView()
}
