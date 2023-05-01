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

func startGame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    guard let inputValue = readLine(),
          let inputValue = Menu.menuRawValues[inputValue],
          Menu.allMenu.contains(inputValue)
    else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return
    }
}

