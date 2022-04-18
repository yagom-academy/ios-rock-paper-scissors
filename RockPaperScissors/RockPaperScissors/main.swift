//
//  RockPaperScissors - main.swift
//  Created by kiwi, bard.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumber = getComputerNumber()

gameStart()

func gameStart() {
    printMenu()
    let userInput = inputNumber()
    switch userInput {
    case "0":
        print("게임 종료")
    case let number where number == "1" ||  number == "2" || number == "3"  :
        getResult(userNumber:number)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        gameStart()
    }
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func inputNumber() -> String {
    let userNumber = readLine()
    guard let inputNumber = userNumber else { return "" }
    return inputNumber
}

func getResult(userNumber: String) {
    if computerNumber == userNumber {
        print("비겼습니다!")
        computerNumber = getComputerNumber()
        gameStart()
    } else if computerNumber == "1" && userNumber == "3" {
        print("졌습니다!")
        print("게임 종료")
    } else if computerNumber == "2" && userNumber == "1" {
        print("졌습니다!")
        print("게임 종료")
    } else if computerNumber == "3" && userNumber == "2" {
        print("졌습니다!")
        print("게임 종료")
    } else {
        print("이겼습니다!")
        print("게임 종료")
    }
}

func getComputerNumber() -> String {
    let computerRandomNumber = String(Int.random(in: 1...3))
    return computerRandomNumber
}
