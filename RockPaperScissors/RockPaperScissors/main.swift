//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let randomNumberRange: ClosedRange<Int> = 1...3
var continueGameCheck: Bool = true
let cardList: Array<String> = ["1","2","3"]

func startGame() {
    
    while continueGameCheck {
        printUserInterface()
        let userSelectedCard = readLine()?.trimmingCharacters(in: .whitespaces) ?? ""
        
        if userSelectedCard == "0" {
            switchContiueGameCheck()
        } else if verifyUserInput(userChoiceCard: userSelectedCard){
            judgeMatchResult(inputUserNumber: userSelectedCard)
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
    printGameOver()
}

func printUserInterface() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func generateComputerNumber() -> Int {
    return Int.random(in: randomNumberRange)
}

func verifyUserInput(userChoiceCard: String) -> Bool {
    if cardList.contains(userChoiceCard) {
        return true
    } else {
        return false
    }
}

func printGameOver() {
    print("게임 종료")
}

func switchContiueGameCheck() {
    continueGameCheck = !continueGameCheck
}

func judgeMatchResult(inputUserNumber: String) {
    let computerRandomNumber = generateComputerNumber()
    
    if (inputUserNumber == "3" && computerRandomNumber == 2) || (inputUserNumber == "2" && computerRandomNumber == 1) ||
       (inputUserNumber == "1" && computerRandomNumber == 3) {
        printMatchResult(matchResult: "win")
        switchContiueGameCheck()
    } else if inputUserNumber == String(computerRandomNumber){
        printMatchResult(matchResult: "tie")
    } else {
        printMatchResult(matchResult: "lose")
        switchContiueGameCheck()
    }
}

func printMatchResult(matchResult: String) {
    switch matchResult {
    case "win":
        print("이겼습니다!")
    case "lose":
        print("졌습니다!")
    default:
        print("비겼습니다!")
    }
}

startGame()
