//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

enum rockPaperScissors: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
    case error
}

enum gameResult {
    case win
    case loss
    case tie
    case error
}

func rockPaperScissorsGameStart() {
    var ifWinnerIsFound: Bool = false
    
    repeat {
        printMenu()
        let oneDigitComputerNumber: Int = makeOneDigitComputerNumber()
        let userSelectedNumber: String = selectedUserGameMenuNumber()
        if userSelectedNumber == "0" { break }
        
        let computerHand: rockPaperScissors = convert(number: String(oneDigitComputerNumber))
        let userHand: rockPaperScissors = convert(number: userSelectedNumber)
        let result: gameResult = findIfUserWin(computerNumber: computerHand, userNumber: userHand)
        
        if result == .win || result == .loss {
            ifWinnerIsFound = true
        }
        printResult(result: result)
    } while !ifWinnerIsFound
    print("게임 종료")
}

func printResult(result: gameResult) {
    switch result {
    case .win:
        print("이겼습니다!")
    case .loss:
        print("졌습니다!")
    case .tie:
        print("비겼습니다!")
    case .error:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func makeOneDigitComputerNumber() -> Int {
    let oneDigitComputerNumber = Int.random(in: 1...3)
    return oneDigitComputerNumber
}

func selectedUserGameMenuNumber() -> String {
    guard let userSelectedNumber = readLine() else { return "" }
    return userSelectedNumber
}

func findIfUserWin(computerNumber: rockPaperScissors, userNumber: rockPaperScissors) -> gameResult {
    switch (computerNumber, userNumber) {
    case (.rock, .paper), (.scissors, .rock), (.paper, .scissors):
        return .win
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        return .loss
    case (.rock, .rock), (.scissors, .scissors), (.paper, .paper):
        return .tie
    default:
        return .error
    }
}

func convert(number: String) -> rockPaperScissors {
    switch number {
    case "1":
        return .scissors
    case "2":
        return .rock
    case "3":
        return .paper
    default:
        return .error
    }
}

rockPaperScissorsGameStart()
