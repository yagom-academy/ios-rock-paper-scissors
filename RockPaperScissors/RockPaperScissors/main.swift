//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
    case etc
}
var userValue: RockPaperScissors = .etc
var computerValue: RockPaperScissors = .etc
typealias WhosWin = (computer: Bool, user: Bool, draw: Bool)
var whosWin: WhosWin = (false, false, false)

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func inputUserNumber() {
    if let userNumber = readLine() {
        switch userNumber {
        case "1":
            userValue = .scissors
        case "2":
            userValue = .rock
        case "3":
            userValue = .paper
        case "0":
            return
        default:
            printMenu()
        }
    }
}
