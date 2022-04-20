//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum GameResult: String {
    case win = "WIN"
    case draw = "DRAW"
    case lose = "LOSE"     
}

enum Hand: Int {
    case scissors = 1
    case rock = 2
    case paper = 3

    func returnRockPaperScissors() -> String {
        switch self {
        case .scissors:
            return "scissors"
        case .rock:
            return "rock"      
        case .paper:
            return "paper"
        }
    }
}

private func convertUserInputToHand(input: String) -> String {
    guard let convertedInput = Int(input) else { return "" }
    if let userHandCase = Hand(rawValue: convertedInput) {
        return userHandCase.returnRockPaperScissors()
    }
    return ""
}

private func convertComputerNumberToHand() -> String {
    if let computerHandCase = Hand(rawValue: Int.random(in: 1...3)) {
        return computerHandCase.returnRockPaperScissors()
    }
    return ""
}

private func showGameMenu() {
    printGameMenu()
}

private func printExitMessage() {
    print("게임 종료")
}

private func printGameMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    playGame()
}

private func inputUserHand() -> String {
    return readLine() ?? ""
}

private func playGame() {
    let userHand = inputUserHand()
        switch userHand {
        case "1", "2", "3" :
            return comparePlayerAndComputerHand(userHand: convertUserInputToHand(input: userHand), computerHand: convertComputerNumberToHand())
        case "0" :
            printExitMessage()
        default :
            print("잘못된 입력입니다. 다시 시도해주세요.")
            showGameMenu()
        }
}

private func comparePlayerAndComputerHand(userHand: String, computerHand: String) {
    if computerHand == "scissors" && userHand == "rock" || computerHand == "rock" && userHand == "paper" || computerHand == "paper" && userHand == "scissors" {
        printResult(gameResult: GameResult.win)
    } else if computerHand == userHand {
        printResult(gameResult: GameResult.draw)
        showGameMenu()
    } else {
        printResult(gameResult: GameResult.lose)
    }
}

private func printResult(gameResult: GameResult) {
    let result: GameResult = gameResult
    switch result {
    case .draw:
        print("비겼습니다!")
    case .win:
        print("이겼습니다!")
        printExitMessage()
    case .lose:
        print("졌습니다!")
        printExitMessage()
    }
}

showGameMenu()
