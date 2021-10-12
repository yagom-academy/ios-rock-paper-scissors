//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Hand: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum GameResult: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

func playRockPaperScissors(){
    let userInput = receiveVaildInput()
    
    if userInput == 0 { return }
    
    guard let userHand: Hand = Hand(rawValue: userInput) else { return }
    
    guard let computerHand = Hand(rawValue: makeRandomNumber()) else { return }
    
    judgeRockPaperScissors(userNumber: userHand.rawValue, computerNumber: computerHand.rawValue)
}

func receiveVaildInput() -> Int {
    var isInvalid: Bool = true
    var validInput: String = ""
    
    while isInvalid {
        printRockPaperScissors()
        validInput = receiveInput()
        isInvalid = isValidInput(validInput: validInput)
    }
    
    var checkedInput: Int = 0
    
    if let a = Int(validInput) {
        checkedInput = a
    }
    
    return checkedInput
}

func receiveInput() -> String {
    if let input = readLine() {
        return input
    } else {
        return ""
    }
}

func isValidInput(validInput: String) -> Bool {
    
    switch validInput {
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

func printRockPaperScissors(){
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func makeRandomNumber() -> Int {
    return Int.random(in: 1...3)
}

func judgeRockPaperScissors(userNumber: Int, computerNumber: Int) {
    var gameResult: GameResult
    
    // MARK: 테스트용
    print(computerNumber)
    
    switch (userNumber, computerNumber) {
    case (1, 3), (2, 1), (3, 2):
        gameResult = .win
    case (1, 1), (2, 2), (3, 3):
        gameResult = .draw
    default:
        gameResult = .lose
    }
    
    print(gameResult.rawValue)
    
    if gameResult == .draw {
        playRockPaperScissors()
    } else {
        print("게임 종료")
    }
}

playRockPaperScissors()
