//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func runGame() {
    printGameMenu()
    
    let userInput = readLine()
    
    switch userInput {
    case "0":
        printEndMessage()
    case "1", "2", "3":
        compareNumbers(computerNumber: generateRandomNumber(), userInputnumber: receiveUserInput(input: userInput))
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        runGame()
    }
}

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

func receiveUserInput(input: String?) -> Int {
    var stringTypeUserInput = ""
    var intTypeUserInput = 0

    if let userInput = input {
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
        runGame()
    }
    
    switch subtractionValue {
    case 1, -2:
        print("이겼습니다!")
        printEndMessage()
        return
    case -1, 2:
        print("졌습니다!")
        printEndMessage()
        return
    default:
        break
    }
}

runGame()
