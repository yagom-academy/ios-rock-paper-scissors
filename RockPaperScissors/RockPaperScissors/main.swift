//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

enum rockPaperScissors: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
    case error = "Error"
}

func rockPaperScissorsGameStart() {
    
//    switch userSelectedNumber {
//    case userSelectedNumber == oneDigitComputerNumber:
//        print("비겼습니다!")
//        case
//    }
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
    return oneDigitComputerNumber
}

func selectedUserGameMenuNumber() -> String {
    guard let userSelectedNumber = readLine() else { return "" }
    return userSelectedNumber
}

//func convertStringToInt(_ stringTypeComputerNumber: String) -> Int {
//    guard let convertedIntTypeElement = stringTypeComputerNumber.compactMap { Int($0) } else { return }
//    return convertedIntTypeElement
//}



func findIfUserWin(computerNumber: rockPaperScissors, userNumber: rockPaperScissors) -> Bool {
    switch (computerNumber, userNumber) {
    case (.rock, .paper):
        return true
    case (.rock, .scissors):
        return false
    case (.paper, .scissors):
        return true
    default:
        return false
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
