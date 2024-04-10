//
//  MenuItem.swift
//  AnimationsRive
//
//  Created by Silvia España Gil on 10/4/24.
//

import Foundation
import RiveRuntime

struct MenuItem: Identifiable {
    
    var id = UUID()
    var text: String
    var icon: RiveViewModel
    var menu: SelectedMenu
}
