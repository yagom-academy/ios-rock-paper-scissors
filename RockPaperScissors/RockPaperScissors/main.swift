//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors: Int, CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum GameState: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func generateComputerValue() -> RockPaperScissors {
    guard let value = RockPaperScissors.allCases.randomElement() else {
        return generateComputerValue()
    }
    return value
}

func inputUserValue() -> RockPaperScissors? {
    printMenu()
    guard let userNumber = readLine(), let convertedNumber = Int(userNumber) else {
        printError()
        return inputUserValue()
    }
    
    if convertedNumber == 0 {
        print("게임 종료")
        return nil
    }
    
    guard let userValue = RockPaperScissors(rawValue: convertedNumber) else {
        printError()
        return inputUserValue()
    }
    return userValue
}

func printGameResult(gameResult: GameState) {
    print(gameResult.rawValue)
}

func compareValue(myValue: RockPaperScissors, otherValue: RockPaperScissors) -> GameState {
    switch (myValue, otherValue) {
    case (.rock, .rock):
        return .draw
    case (.rock, .paper):
        return .lose
    case (.rock, .scissors):
        return .win
        
    case (.paper, .rock):
        return .win
    case (.paper, .paper):
        return .draw
    case (.paper, .scissors):
        return .lose
        
    case (.scissors, .rock):
        return .lose
    case (.scissors, .paper):
        return .win
    case (.scissors, .scissors):
        return .draw
    }
}

func printError() {
    print("잘못된 입력입니다. 다시 시도해주세요")
}

func startGame() {
    if let userValue = inputUserValue() {
        printGameResult(gameResult: compareValue(myValue: userValue, otherValue: generateComputerValue()))
        startGame()
    } else {
        return
    }
}

startGame()
