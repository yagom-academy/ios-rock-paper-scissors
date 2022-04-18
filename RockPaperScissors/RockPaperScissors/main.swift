//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

//var userInput = 0
var computerInput:Int = 0

func printUserOption() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func makeComputerRandomNumber() {
    computerInput = Int.random(in: 1...3)
}

func inputUserNumber() -> Int {
    var userInput: Int
    let inputNumber = readLine() ?? ""
    userInput = checkNumber(userInput: inputNumber)
    return userInput
}

func checkNumber(userInput: String) -> Int {
    var selectedNumber = -1
    if let verifiedUserInput = Int(userInput) {
        switch verifiedUserInput {
        case 0,1,2,3:
            selectedNumber = verifiedUserInput
        default:
            selectedNumber = -1
        }
    }
    return selectedNumber
}
