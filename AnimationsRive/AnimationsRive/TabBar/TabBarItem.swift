//
//  TabBarItem.swift
//  AnimationsRive
//
//  Created by Silvia España Gil on 8/4/24.
//

import Foundation
import RiveRuntime

struct TabBarItem: Identifiable {
    
    let id = UUID()
    let icon: RiveViewModel
    let tab: Tab
}
