//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Darwin

enum rockPaperScissors: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
    case error = "Error"
}

func rockPaperScissorsGameStart() {
    var ifWinnerIsFound: Bool = false
    
    repeat {
        printMenu()
        let oneDigitComputerNumber: Int = makeOneDigitComputerNumber()
        let userSelectedNumber: String = selectedUserGameMenuNumber()
        guard let computerHand: rockPaperScissors = convert(number: String(oneDigitComputerNumber)) else { return }
        guard let userHand: rockPaperScissors = convert(number: userSelectedNumber) else { return }
        ifWinnerIsFound = findIfUserWin(computerNumber: computerHand, userNumber: userHand)
    } while !ifWinnerIsFound
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func makeOneDigitComputerNumber() -> Int {
    let oneDigitComputerNumber = Int.random(in: 1...3)
    print("oneDigitComputerNumber:", oneDigitComputerNumber)
    return oneDigitComputerNumber
}

func selectedUserGameMenuNumber() -> String {
    guard let userSelectedNumber = readLine() else { return "" }
    return userSelectedNumber
}

func findIfUserWin(computerNumber: rockPaperScissors, userNumber: rockPaperScissors) -> Bool {
    switch (computerNumber, userNumber) {
    case (.rock, .paper):
        print("이겼습니다!")
        return true
    case (.scissors, .rock):
        print("이겼습니다!")
        return true
    case (.paper, .scissors):
        print("이겼습니다!")
        return true
    case (.scissors, .paper):
        print("졌습니다!")
        return true
    case (.paper, .rock):
        print("졌습니다!")
        return true
    case (.rock, .scissors):
        print("졌습니다!")
        return true
    case (.rock, .rock):
        print("비겼습니다.")
        return false
    case (.scissors, .scissors):
        print("비겼습니다.")
        return false
    case (.paper, .paper):
        print("비겼습니다.")
        return false
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return true
    }
}

func convert(number: String) -> rockPaperScissors? {
    switch number {
    case "1":
        return rockPaperScissors.scissors
    case "2":
        return rockPaperScissors.rock
    case "3":
        return rockPaperScissors.paper
    default:
        return nil
    }
}

rockPaperScissorsGameStart()
