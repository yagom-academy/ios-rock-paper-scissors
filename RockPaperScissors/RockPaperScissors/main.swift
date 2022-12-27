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

func validationUserInput(userInput: String) throws -> Int {
    guard userInput != "" else {
        throw InputError.invalidInput
    }
    guard let number = Int(userInput) else {
        throw InputError.invalidInput
    }
    guard number >= 0, number <= 3 else {
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
    
    guard let userHand = handShapeList[validationResult - 1]  else {
        return nil
    }
    
    return userHand
}

func compareHandShape(computerHand: HandShape?, userHand: HandShape?) -> MatchResult? {
    guard let computerHand = computerHand, let userHand = userHand else {
        return nil
    }
    var matchResult: MatchResult? = nil
    
    switch (computerHand, userHand) {
    case (HandShape.rock, HandShape.scissors),
        (HandShape.scissors, HandShape.paper),
        (HandShape.paper, HandShape.rock):
        return .lose
    case (HandShape.scissors, HandShape.rock),
        (HandShape.paper, HandShape.scissors),
        (HandShape.rock, HandShape.paper):
        return .win
    default:
        return .draw
    }
    
    return matchResult
}

func startGame() {
    var selectGameEnd: Bool = false
    
    while !selectGameEnd {
        printMenu()
        
        let input = readUserInput()
        let userNumber = validationUserInput(userInput: input)
        if userNumber == .success(0){
            print("게임 종료")
            selectGameEnd.toggle()
            continue
        }
        let userHand = generateUserHand(validationResult: userNumber)
        let computerHand = generateComputerHand()
        
        if let matchResult = compareHand(computerHand: computerHand, userHand: userHand) {
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
}

startGame()
