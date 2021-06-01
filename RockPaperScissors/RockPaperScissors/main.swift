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
    
    static func generateRandomCase() -> RockPaperScissors {
        let rockPaperScissors: [RockPaperScissors] = [.scissors, .rock, .paper]
        let index = Int.random(in: 0...rockPaperScissors.count - 1)
        return rockPaperScissors[index]
    }
}

enum GameResult {
    case win
    case lose
    case tie
    
    func showGameResultMessage() {
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

func generateComputerRockPaperScissorsValue() -> RockPaperScissors {
//    if let unwrappedValue = RPS(rawValue: Int.random(in: 1...3)) {
//        return unwrappedValue
//    }
//    return RPS.rock
    return RockPaperScissors.generateRandomCase()
}

func playRockScissorsPaperWith(
    computerChoice: RockPaperScissors,
    userChoice: RockPaperScissors
) -> GameResult {
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
    gameResult.showGameResultMessage()
}

func showGameEndMessage() {
    print("게임 종료")
}

func playGame() {
    let EXIT_NUMBER = 0
    while true {
        let userInputNumber: Int = returnUserSelectedNumber()
        if userInputNumber == EXIT_NUMBER {
            showGameEndMessage()
            break
        }
        if let userRockPaperScissors: RockPaperScissors = RockPaperScissors(rawValue: userInputNumber) {
            let computerRockPaperScissors: RockPaperScissors = generateComputerRockPaperScissorsValue()
            let rockPaperScissorsResult: GameResult = playRockScissorsPaperWith(
                computerChoice: computerRockPaperScissors,
                userChoice: userRockPaperScissors
            )
            showResultMessage(gameResult: rockPaperScissorsResult)
        } else {
            showWrongInputMessage()
        }
    }
}

playGame()
