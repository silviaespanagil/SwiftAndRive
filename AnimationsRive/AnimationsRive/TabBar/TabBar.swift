//
//  TabBar.swift
//  AnimationsRive
//
//  Created by Silvia España Gil on 8/4/24.
//

import SwiftUI
import RiveRuntime

struct TabBar: View {
    
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
    var tabItems = [
        TabBarItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), tab: .home),
        TabBarItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), tab: .search),
        TabBarItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), tab: .timer),
        TabBarItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), tab: .bell),
        TabBarItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "USER_Interactivity", artboardName: "USER"), tab: .user)
    ]
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            HStack {
                
                content
            }
            .padding(12)
            .background(Color("Background 2").opacity(0.8))
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(color: Color("Background 2").opacity(0.3), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 24)
        }
    }
    @ViewBuilder
    var content: some View {
        
        ForEach(tabItems) { item in
            
            Button {
                item.icon.setInput("active", value: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    item.icon.setInput("active", value: false)
                }
                withAnimation {
                    selectedTab = item.tab
                }
            } label: {
                item.icon.view()
                    .frame( height: 36)
                    .opacity(selectedTab == item.tab ? 1 : 0.5)
                    .background(
                        VStack {
                            RoundedRectangle(cornerRadius: 2)
                                .fill(.pink)
                                .frame(width: selectedTab == item.tab ? 20 : 0, height: 4)
                                .offset(y: -4)
                                .opacity(selectedTab == item.tab ? 1 : 0)
                            
                            Spacer()
                        }
                    )
            }
        }
    }
}



#Preview {
    TabBar()
}
