//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Sign: String {
    case rock = "1"
    case scissors = "2"
    case paper = "3"
}

func printStartMessage() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
}

func generateComputerSign() -> Sign? {
    let indexOfSign: String = String(Int.random(in: 1...3))
    let computerSign = Sign(rawValue: indexOfSign)
    return computerSign
}
