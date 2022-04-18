//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var computerInput: Int = 0
var winningNumberCases = [(1,3),(2,1),(3,2)]

func printUserOption() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func makeComputerRandomNumber() {
    computerInput = Int.random(in: 1...3)
}

func inputUserNumber() -> Int {
    printUserOption()
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

func printErrorMessage() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func startGame() {
    makeComputerRandomNumber()
    while true {
        let userInput = inputUserNumber()
        if userInput == -1 {
            printErrorMessage()
            continue
        }
        if userInput == 0 {
            print("게임 종료")
            break
        }
        let extractedNumber = compareTwoNumbers(userInput: userInput, computerInput: computerInput)
        printResult(matchResult: extractedNumber)
        if extractedNumber == 2 || extractedNumber == 3 {
            print("게임 종료")
            break
        }
    }
}

func compareTwoNumbers (userInput: Int, computerInput: Int) -> Int {
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

func printResult(matchResult: Int) {
    switch matchResult {
    case 2 :
        print("이겼습니다!")
    case 3 :
        print("졌습니다!")
    default:
        print("비겼습니다!")
    }
}

startGame()

