//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func selectGameMenu() -> String {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
    guard let userInput = readLine() else { return "" }
    return userInput
}

func checkValidity(userInput: String) -> Int? {
    let arrayOfValidNumbers = ["0", "1", "2", "3"]
    if arrayOfValidNumbers.contains(userInput) {
        guard let intUserInput = Int(userInput) else { return nil }
        return intUserInput
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return checkValidity(userInput: selectGameMenu())
    }
}

func checkStartGame(userInput: String) {
    if userInput == "0" {
        print("게임 종료")
        return
    } else {
        decideWinner(userNumber: userInput)
    }
}

func decideWinner(userNumber: String) {
    guard let validNumber = checkValidity(userInput: userNumber) else { return }
    let numberRange: ClosedRange<Int> = 1...3
    let computerNumber = Int.random(in: numberRange)
    let number: Int = validNumber - computerNumber
    switch number {
    case 1, -2:
        print("이겼습니다!\n게임 종료")
    case 2, -1:
        print("졌습니다!\n게임 종료")
    default:
        print("비겼습니다!")
    }
}

checkStartGame(userInput: selectGameMenu())
