//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Hand: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

enum GameType {
    case rockPaperScissors
    case mukChiPa
}

enum PlayerType {
    case user
    case computer
}

enum GameResult: CustomStringConvertible {
    var description: String {
        switch self {
        case .win:
            return "이겼습니다."
        case .lose:
            return "졌습니다."
        case .draw:
            return "비겼습니다."
        }
    }
    case win
    case lose
    case draw
}



func playRockPaperScissors() -> (GameResult, Bool)  {
    var isExit = false
    guard let userInput = receiveVaildInput() else {
        return (.win, isExit)
    }
    guard let userHand = Hand(rawValue: userInput) else {
        return (.win, isExit)
    }
    guard let computerHand = Hand(rawValue: makeRandomNumber()) else {
        return (.win, isExit)
    }
    var gameResult: GameResult
    
    if userInput == "0" {
        isExit = true
        return (.win, isExit)
    }

    gameResult = judgeRockPaperScissors(userHand, computerHand)
    
    return (gameResult, isExit)
}

func receiveVaildInput() -> String? {
    var isInvalid: Bool = true
    var input: String = ""
    
    while isInvalid {
        printHandChoiceMenu()
        input = receiveInput()
        isInvalid = isInvalidInput(shouldCheckedInput: input)
    }
    
    return input
}

func receiveInput() -> String {
    guard let input = readLine() else {
        return ""
    }
    
    return input
}

func isInvalidInput(shouldCheckedInput: String) -> Bool {
    switch shouldCheckedInput {
    case "0", "1", "2", "3":
        return false
    default:
        printErrorMessage()
        return true
    }
}

func printErrorMessage() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func printHandChoiceMenu(){
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func makeRandomNumber() -> String{
    return String(Int.random(in: 1...3))
}

func judgeRockPaperScissors(_ userHand: Hand, _ computerHand: Hand) -> GameResult {
    
    var gameResult: GameResult
    
    switch (userHand, computerHand) {
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        gameResult = .win
    case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
        gameResult = .draw
    default:
        gameResult = .lose
    }
    
    return gameResult
}

playRockPaperScissors()
