//
//  RockPaperScissors - main.swift
//  Created by BaekGom, Finnn
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
            endGame()
        } else if verifyUserInput(of: userSelectedCard) {
            judgeMatchResult(inputUserNumber:
                                convertNumberToGameCard(targetNumber: userSelectedCard))
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
    printGameOver()
}

func printUserInterface() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func generateComputerNumber() -> RockPaperScissors? {
    return RockPaperScissors(rawValue: Int.random(in: randomNumberRange)) ?? .wrong
}

func verifyUserInput(of userChoiceCard: String) -> Bool {
    if cardList.contains(userChoiceCard) {
        return true
    } else {
        return false
    }
}

func convertNumberToGameCard(targetNumber: String) -> RockPaperScissors {
    switch targetNumber {
    case "1":
        return .scissors
    case "2":
        return .rock
    case "3":
        return .paper
    default:
        return .wrong
    }
}

func printGameOver() {
    print("게임 종료")
}

func endGame() {
    continueGameCheck = !continueGameCheck
}

func judgeMatchResult(inputUserNumber: RockPaperScissors) {
    let computerRandomNumber = generateComputerNumber()
    
    if (inputUserNumber == .paper && computerRandomNumber == .rock) ||
        (inputUserNumber == .rock && computerRandomNumber == .scissors) ||
        (inputUserNumber == .scissors && computerRandomNumber == .paper) {
        printMatchResult(matchResult: "win")
        endGame()
    } else if inputUserNumber == computerRandomNumber {
        printMatchResult(matchResult: "tie")
    } else {
        printMatchResult(matchResult: "lose")
        endGame()
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
