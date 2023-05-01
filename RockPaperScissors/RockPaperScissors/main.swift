//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Menu: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
    case exit = "0"
    
    static let allMenu: Array<Menu> = [.scissors, .rock, .paper, .exit]
    static let menuRawValues: Dictionary<String, Menu> = Menu.allMenu.reduce(into: Dictionary<String, Menu>()) { $0[$1.rawValue] = $1 }
}

