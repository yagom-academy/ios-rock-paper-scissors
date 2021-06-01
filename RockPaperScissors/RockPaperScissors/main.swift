//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


enum RPS: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum GameResult: String {
    case win = "win"
    case lose = "lose"
    case tie = "tie"
    
    func printMessage() {
        switch self {
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .tie:
            print("비겼습니다!")
        }
    }
}

func showInfoMessage() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
}

func showWrongInputMessage() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func returnUserSelectedNumber() -> Int {
    showInfoMessage()
    guard let userInput = readLine(),
          let convertedUserInput = Int(userInput),
          (0...3).contains(convertedUserInput) else {
        showWrongInputMessage()
        return returnUserSelectedNumber()
    }
    return convertedUserInput
}

func generateComputerRPSValue() -> RPS {
    if let unwrappedValue = RPS(rawValue: Int.random(in: 1...3)) {
        return unwrappedValue
    }
    return RPS.rock
}

func playRockScissorsPaperWith(computerChoice: RPS, userChoice: RPS) -> GameResult {
    let numberGap: Int = userChoice.rawValue - computerChoice.rawValue
    switch numberGap {
    case 1, -2:
        return GameResult.win
    case 2, -1:
        return GameResult.lose
    default:
        return GameResult.tie
    }
}

func showResultMessage(gameResult: GameResult) {
    gameResult.printMessage()
}

func showGameEndMessage() {
    print("게임 종료")
}

func main() {
    let EXIT_NUMBER = 0
    while true {
        let userInputNumber: Int = returnUserSelectedNumber()
        if userInputNumber == EXIT_NUMBER {
            showGameEndMessage()
            break
        }
        if let userRPS: RPS = RPS(rawValue: userInputNumber) {
            let computerRPS: RPS = generateComputerRPSValue()
            let resultRPS: GameResult = playRockScissorsPaperWith(computerChoice: computerRPS, userChoice: userRPS)
            showResultMessage(gameResult: resultRPS)
        } else {
            showWrongInputMessage()
        }
    }
}

main()
