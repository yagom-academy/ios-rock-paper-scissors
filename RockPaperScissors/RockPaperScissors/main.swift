//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 


enum Game: Int, CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
}

var programRunning = true

while programRunning {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    if let input: String = readLine() {
        switch input {
        case "1":
            computeGame(userInput: .scissors)
        case "2":
            computeGame(userInput: .rock)
        case "3":
            computeGame(userInput: .paper)
        case "0":
            programRunning = false
            print("게임 종료")
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

func computeGame(userInput: Game) {
    guard let computerNumber: Game = Game.allCases.randomElement() else {
        return
    }
    if userInput == computerNumber {
        print("비겼습니다!")
    } else if (userInput == .scissors && computerNumber == .paper)
                 || (userInput == .rock && computerNumber == .scissors)
                 || (userInput == .paper && computerNumber == .rock) {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}
