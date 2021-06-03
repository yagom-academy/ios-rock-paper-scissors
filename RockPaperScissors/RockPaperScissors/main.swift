//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors: Int, CaseIterable {
    case scissors = 1
    case rock
    case paper
    
    static func generateRandomHand() -> RockPaperScissors {
        return RockPaperScissors.allCases.randomElement() ?? .rock
    }
    
    var menuNumber: Int {
        switch self {
        case .scissors:
            return 1
        case .rock:
            return 2
        case .paper:
            return 3
        }
    }
    
    func playRockScissorsPaper(against opponent: RockPaperScissors) -> GameResult {
        let numberGap = self.menuNumber - opponent.menuNumber
        let winNumberGaps = [1, -2]
        let tieNumberGaps = [0]
        
        if winNumberGaps.contains(numberGap) {
            return .win
        }
        if tieNumberGaps.contains(numberGap) {
            return .tie
        }
        return .lose
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

func showMenu() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
}

func showWrongInputMessage() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
}

func showGameEndMessage() {
    print("게임 종료")
}

func receiveUserInputNumber() -> Int {
    showMenu()
    let minMenuNumber = 0
    let maxMenuNumber = 3
    guard let userInput = readLine(),
          let convertedUserInput = Int(userInput),
          (minMenuNumber...maxMenuNumber).contains(convertedUserInput) else {
        showWrongInputMessage()
        return receiveUserInputNumber()
    }
    return convertedUserInput
}

func playGame() {
    let exitNumber = 0
    while true {
        let userInputNumber: Int = receiveUserInputNumber()
        if userInputNumber == exitNumber {
            showGameEndMessage()
            break
        }
        if let userHand = RockPaperScissors(rawValue: userInputNumber) {
            let computerHand = RockPaperScissors.generateRandomHand()
            let gameResult: GameResult = userHand.playRockScissorsPaper(against: computerHand)

            gameResult.showGameResultMessage()
        } else {
            showWrongInputMessage()
        }
    }
}

playGame()
