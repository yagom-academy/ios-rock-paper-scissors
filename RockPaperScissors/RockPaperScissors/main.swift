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
}

func showInfoMessage() -> Int {
    return 1
}

func generateComputerRPSValue() -> RPS {
    return RPS.rock
}

func playRockScissorsPaperWith(player1: RPS, player2: RPS) -> GameResult {
    return GameResult.win
}

func showResultMessage(gameResult: GameResult) {
    
}

func showGameEndMessage() {
    
}

func main() {
    let EXIT_NUMBER = 0
    while true {
        let userInput: Int = showInfoMessage()
        if userInput == EXIT_NUMBER {
            showGameEndMessage()
            break
        }
        if let userRPS: RPS = RPS(rawValue: userInput) {
            let computerRPS: RPS = generateComputerRPSValue()
            let resultRPS: GameResult = playRockScissorsPaperWith(player1: computerRPS, player2: userRPS)
            showResultMessage(gameResult: resultRPS)
        }
    }
}

main()
