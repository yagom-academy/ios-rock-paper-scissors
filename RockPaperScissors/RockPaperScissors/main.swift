//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
    case etc
}

enum GameResult: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}
var gameResult: GameResult = .lose
var userValue: RockPaperScissors = .etc
var computerValue: RockPaperScissors = .etc
var isExit: Bool = false

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func generateComputerValue() {
    if let value = RockPaperScissors(rawValue: Int.random(in: 1...3)) {
        computerValue = value
    }
}

func inputUserValue() {
    if let userNumber = readLine() {
        switch userNumber {
        case "1":
            userValue = .scissors
        case "2":
            userValue = .rock
        case "3":
            userValue = .paper
        case "0":
            isExit = true
            return
        default:
            printMenu()
        }
    }
}

func printGameResult() {
    print(gameResult.rawValue)
}

func checkGameResult(user: RockPaperScissors, computer: RockPaperScissors) {
   
    if user == computer {
        gameResult = .draw
    }
    
    switch user {
    case .scissors:
        if computer == .paper {
            gameResult = .win
        }
    case .rock:
        if computer == .scissors {
            gameResult = .win
        }
    case .paper:
        if computer == .rock {
            gameResult = .win
        }
    case .etc:
        printError()
    }
}

func printError() {
    print("잘못된 입력입니다. 다시 시도해주세요")
    startGame()
}

func resetGame() {
    gameResult = .lose
    userValue = .etc
    computerValue = .etc
}

func startGame() {
    while isExit == false {
        printMenu()
        generateComputerValue()
        inputUserValue()
        print(userValue)
        checkGameResult(user: userValue, computer: computerValue)
        printGameResult()
        resetGame()
    }
}

startGame()
