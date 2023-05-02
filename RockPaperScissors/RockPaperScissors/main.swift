//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

enum Menu: String, CaseIterable {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
    case exit = "0"
}

func startGame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let input: String = readLine() else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
        return
    }
    
    switch input {
    case Menu.scissors.rawValue:
        playGame(with: .scissors)
    case Menu.rock.rawValue:
        playGame(with: .rock)
    case Menu.paper.rawValue:
        playGame(with: .paper)
    case Menu.exit.rawValue:
        print("게임 종료")
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
    }
}

func playGame(with userHand: Menu) {
    guard let rivalHand: Menu = Menu.allCases.randomElement() else {
        return
    }
    
    if userHand == rivalHand {
        print("비겼습니다!")
        startGame()
    } else if (userHand == .scissors && rivalHand == .paper)
                 || (userHand == .rock && rivalHand == .scissors)
                 || (userHand == .paper && rivalHand == .rock) {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}

startGame()
