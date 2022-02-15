//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Hand: String {
    case scissors = "1", rock = "2", paper = "3"
}

func startGame() {
    print("가위(1),바위(2),보(3)!<종료 :0>: ", terminator: "")
    let userInput = inputValue()
    switch userInput{
    case "1","2","3" :
        playRockPaperScissors(userHand: userInput)
    case "0" :
        print("프로그램 종료")
        return
    default:
        print("입력이 잘못되었습니다")
        startGame()
    }
}

func inputValue() -> String {
    guard let inputValue = readLine() else { return "" }
    return inputValue
}

func playRockPaperScissors(userHand: String) {
    let computerHand = String(Int.random(in: 1...3))
    matchHand(userHand: userHand, computerHand: computerHand)
}

func matchHand(userHand: String, computerHand: String) {
    if userHand == computerHand {
        print("비겼습니다")
        startGame()
    } else if userHand == Hand.scissors.rawValue && computerHand == Hand.paper.rawValue || userHand == Hand.rock.rawValue && computerHand == Hand.scissors.rawValue || userHand == Hand.paper.rawValue && computerHand == Hand.rock.rawValue {
        print("유저가 이겼습니다")
    } else {
        print("컴퓨터가 이겼습니다")
    }
}

startGame()
