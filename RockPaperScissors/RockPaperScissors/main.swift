//
//  RockPaperScissors - main.swift
//  Created by kiwi, bard.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var computerNumber = getComputerNumber()

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func inputNumber() -> String {
    let userNumber = readLine()
    guard let inputNumber = userNumber else { return "" }
    return inputNumber
}

func getComputerNumber() -> String {
    let computerRandomNumber = String(Int.random(in: 1...3))
    return computerRandomNumber
}
