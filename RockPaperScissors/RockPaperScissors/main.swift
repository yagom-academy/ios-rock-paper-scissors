//
//  RockPaperScissors - main.swift
//  Created by Harry, Andrew. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료: 0>", terminator: ": ")
}

func readUserInput() -> String {
    guard let userInput = readLine() else {
        return ""
    }
    
    return userInput
}

func validateUserInput(userInput: String) throws -> Int {
    guard userInput != "",
          let number = Int(userInput),
          number >= 0, number <= 3 else {
        throw InputError.invalidInput
    }

    return number
}

func generateComputerHand() -> HandShape? {
    guard let computerHand = HandShape.allCases.randomElement() else {
        return nil
    }
    
    return computerHand
}

func generateUserHand(validationResult: Int) -> HandShape? {
    let handShapeList: [HandShape?] = HandShape.allCases
    
    guard let userHand = handShapeList[validationResult - 1] else {
        return nil
    }
    
    return userHand
}

func compareHandShape(computerHand: HandShape?, userHand: HandShape?) -> MatchResult? {
    guard let computerHand = computerHand, let userHand = userHand else {
        return nil
    }
    
    switch (computerHand, userHand) {
    case (.rock, .scissors),
        (.scissors, .paper),
        (.paper, .rock):
        return .lose
    case (.scissors, .rock),
        (.paper, .scissors),
        (.rock, .paper):
        return .win
    default:
        return .draw
    }
}

func informMatchResult(matchResult: MatchResult?) {
    if let matchResult = matchResult {
        switch matchResult {
        case .win:
            print("이겼습니다!")
        case .draw:
            print("비겼습니다!")
        case .lose:
            print("졌습니다!")
        }
    }
}

func startGame() {
    var selectGameEnd: Bool = false
    
    while !selectGameEnd {
        printMenu()
        
        do {
            let input = readUserInput()
            let userNumber = try validateUserInput(userInput: input)
            if userNumber == 0 {
                print("게임 종료")
                selectGameEnd.toggle()
                continue
            }
            let userHand = generateUserHand(validationResult: userNumber)
            let computerHand = generateComputerHand()
            let matchResult = compareHandShape(computerHand: computerHand, userHand: userHand)
    
            informMatchResult(matchResult: matchResult)
            
        } catch {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

startGame()
