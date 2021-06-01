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
}

enum GameResult: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

var gameResult: GameResult = .lose
var userValue: RockPaperScissors = .paper
var computerValue: RockPaperScissors = .paper
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
    printMenu()
    if let userNumber = readLine() {
        switch userNumber {
        case "1":
            userValue = .scissors
        case "2":
            userValue = .rock
        case "3":
            userValue = .paper
        case "0":
            print("게임 종료")
            isExit = true
        default:
            printError()
            inputUserValue()
        }
    }
}

func printGameResult() {
    print(gameResult.rawValue)
}

func computeGameResult(user: RockPaperScissors, computer: RockPaperScissors) {
    switch user.rawValue - computer.rawValue {
    case -1, 2:
        gameResult = .lose
    case 0:
        gameResult = .draw
    case 1, -2:
        gameResult = .win
    default:
        break
    }
}

func printError() {
    print("잘못된 입력입니다. 다시 시도해주세요")
}

func startGame() {
    generateComputerValue()
    inputUserValue()
    if isExit == false {
        computeGameResult(user: userValue, computer: computerValue)
        printGameResult()
        startGame()
    } else {
        return
    }
    
}

startGame()
