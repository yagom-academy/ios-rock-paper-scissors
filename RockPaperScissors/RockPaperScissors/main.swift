//
//  RockPaperScissors - main.swift
//  Created by kiwi, bard.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func inputMenu() -> String {
    let userInput = readLine()
    guard let menuNumber = userInput, menuNumber != "" else { return "잘못된 입력입니다. 다시 시도해주세요." }
    guard Int(menuNumber) != nil else { return "잘못된 입력입니다. 다시 시도해주세요." }
    return menuNumber
}

func getComputerNumber() -> String {
    let randomNumber = String(Int.random(in: 1...3))
    return randomNumber
}

func getResult(userNumber: String) -> Int {
    if getComputerNumber() == userNumber {
        return 0
    } else if getComputerNumber() == "1" && userNumber == "3" {
        return 2
    } else if getComputerNumber() == "2" && userNumber == "1" {
        return 2
    } else if getComputerNumber() == "3" && userNumber == "2" {
        return 2
    } else {
        return 1
    }
}

func printResult() {
    let getMenu = getResult(userNumber: inputMenu())

    switch getMenu {
    case 0:
        print("비겼습니다!")
    case 1:
        print("이겼습니다!")
    case 2:
        print("졌습니다!")
    default:
        break
    }
}

printMenu()
printResult()

