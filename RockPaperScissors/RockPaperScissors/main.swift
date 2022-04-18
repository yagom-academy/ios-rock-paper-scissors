//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var computerInput:Int = 0
var winningNumberCases = [(1,3),(2,1),(3,2)] //user wins

func printUserOption() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func makeComputerRandomNumber() {
    computerInput = Int.random(in: 1...3)
}

func inputUserNumber() -> Int {
    var userInput: Int
    let inputNumber = readLine() ?? ""
    userInput = checkUserInputNumber(userInput: inputNumber)
    return userInput
}

func checkUserInputNumber(userInput: String) -> Int {
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

func startGame() {
    makeComputerRandomNumber()
    var userInput = inputUserNumber()
    while true {
        if userInput == 0 {
            break
        }
        compareTwoNumbers(userInput: userInput, computerInput: computerInput)
    }
}

func compareTwoNumbers (userInput:Int, computerInput:Int) -> Int {
    var matchResult = 1
    let comparisonGroup = (userInput, computerInput)
    if userInput == computerInput {
        matchResult = 1
    } else if winningNumberCases.contains(where: { $0 == comparisonGroup }) {
        matchResult = 2
    } else {
        matchResult = 3
    }
    return matchResult
}

func printResult(matchResult:Int) {
    switch matchResult {
    case 2 :
        print("이겼습니다!")
    case 3 :
        print("졌습니다!")
    default:
        print("비겼습니다!")
    }
}
