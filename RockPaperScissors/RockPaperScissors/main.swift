//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printGameMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func printEndMessage() {
    print("게임종료")
}

func generateRandomNumber() -> Int {
    let randomNumber = Int.random(in: 1...3)
    
    return randomNumber
}

func receiveUserInput() -> Int {
    var stringTypeUserInput = ""
    var intTypeUserInput = 0

    if let userInput = readLine() {
        stringTypeUserInput = userInput
    }
    
    if let integer = Int(stringTypeUserInput) {
        intTypeUserInput = integer
    }

    return intTypeUserInput
}

func compareNumbers(computerNumber: Int, userInputnumber: Int) {
    let subtractionValue = userInputnumber - computerNumber
    
    if subtractionValue == 0 {
        print("비겼습니다!")
    }
    
    switch subtractionValue {
    case 1, -2:
        print("이겼습니다!")
        printEndMessage()
    case -1, 2:
        print("졌습니다!")
        printEndMessage()
    default:
        break
    }
}
