//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//  last modified by maxhyunm, Mary

import Foundation

enum Menu: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
    case exit = "0"
}

enum Result: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

func startGame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    
    guard let inputValue = readLine(),
          let menu = Menu(rawValue: inputValue)
    else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return
    }
    guard menu != .exit else {
        print("게임 종료")
        return
    }
    
    let gameResult = playGame(menu)
    
    if gameResult == .draw {
        startGame()
    }
}

func playGame(_ users: Menu) -> Result {
    return .win
}
