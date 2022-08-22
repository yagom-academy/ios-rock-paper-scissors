//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var userHand: Int?
let computerHand: Int = Int.random(in: 1...3)

func printRockScissorPaper() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
}

func getUserNumber() {
    guard let input = readLine() else { return }
    guard let userNumber = Int(input) else { return }
    userHand = userNumber
}

func playRockScissorPaper() {
    printRockScissorPaper()
}

playRockScissorPaper()
