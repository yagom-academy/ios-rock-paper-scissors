//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum GameResult {
    case draw
    case win
    case fail
}

func run() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    
    let userInput = readLine()
    
    if let safeUserInput = userInput {
        switch safeUserInput {
        case "1", "2", "3":
            showResult(userInput: safeUserInput)
        case "0":
            print("게임 종료")
        default:
            print("잘못된 입력입니다. 다시 시도하여 주세요.")
        }
    } else{
        print("잘못된 입력입니다. 다시 시도하여 주세요.")
    }
}

func showResult(userInput: String) {
    let gameResult = makeComputerChoice(userInput: userInput)
    switch gameResult {
    case .draw:
        print("비겼습니다!")
    case .win:
        print("이겼습니다!")
    case .fail:
        print("졌습니다.")
    default:
        return
    }
}

func makeComputerChoice(userInput: String) -> GameResult {
    let computerChoice = String(Int.random(in: 1...3))
    print("컴퓨터 : \(computerChoice)")
    
    let isWin: Bool = (userInput == "1" && computerChoice == "3") || (userInput == "2" && computerChoice == "1") || (userInput == "3" && computerChoice == "2")
    
    if userInput == computerChoice {
        return .draw
    } else if isWin {
        return .win
    } else {
        return .fail
    }
}

run()
