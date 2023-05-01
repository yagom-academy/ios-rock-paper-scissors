//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//  last modified by maxhyunm, Mary
//

import Foundation

enum Menu: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
    case exit = "0"
    
    var winningOpponent: Menu {
        switch self {
        case .scissors:
            return .paper
        case .rock:
            return .scissors
        case .paper:
            return .rock
        default:
            return .exit
        }
    }
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
        startGame()
        return
    }
    guard menu != .exit else {
        print("게임 종료")
        return
    }
    
    let gameResult = playGame(menu)
    
    print(gameResult.rawValue)
    
    if gameResult == .draw {
        startGame()
    }
}

func playGame(_ users: Menu) -> Result {
    guard let computer = Menu(rawValue: String(Int.random(in: 1...3))) else {
        return .win
    }
    print("컴퓨터 : \(computer)")
    if users == computer {
        return .draw
    } else if users.winningOpponent == computer {
        return .win
    } else {
        return .lose
    }
}

startGame()
