//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let randomNumberRange = 1...3
var continueGameCheck = true
let selectMenu = "0123"

func startGame() {
    
    while continueGameCheck {
        
        printUserInterface()
        let userInputValue = readLine()?.trimmingCharacters(in: .whitespaces) ?? ""
        
        if userInputValue == "0" {
            printGameOver()
            continueGameCheck = false
            break
        } else {
            if verifyUserInput(userInput: userInputValue) {
                
            } else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
        }
    }
    
}

func printUserInterface() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func generateComputerNumber() -> Int {
    var randomNumber = Int.random(in: randomNumberRange)
    return randomNumber
}

func verifyUserInput(userInput: String) -> Bool {
    if userInput.contains(selectMenu) {
        return true
    } else {
        return false
    }
}

func printGameOver() {
    print("게임 종료")
}

func judgeMatchResult(inputUserNumber: String) {
    let computerRandomNumber = generateComputerNumber()
    
    if inputUserNumber == "1" {
        if computerRandomNumber == 1 {
            printMatchResult(matchResult: "tie")
        }
    } else {
        
    }
}

func printMatchResult(matchResult: String) {
    switch matchResult {
    case "win":
        print("이겼습니다!")
        break
    case "lose":
        print("졌습니다!")
        break
    default:
        print("비겼습니다!")
    }
}

startGame()
