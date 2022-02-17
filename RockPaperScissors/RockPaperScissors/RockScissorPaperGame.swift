//
//  RockScissorPaperGame.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/16.
//

import Foundation

struct RockScissorPaperGame {
    var gameData = GameData()
    
    mutating func playGame() {
        let computerHand = gameData.generateComputerHand()
        let (playerHand, status) = gameData.conveyPlayerHandAndStatus()
        executeByOption(playerHand, computerHand, status)
    }
    
    mutating func executeByOption(_ playerHand: PlayerHands, _ computerHand: PlayerHands, _ status: Status) {
        if status == .exit {
            print(Status.exit.message)
            return
        } else if status == .error{
            print(Status.error.message)
            playGame()
        } else {
            let result = vertifyWinner(playerHand.optionNumber, computerHand.optionNumber)
            displayMatchResult(result)
            executeAfterMatch(result)
        }
    }
    
    mutating func displayMatchResult(_ result: MatchResult) {
        print(result.message)
    }
    
    mutating func executeAfterMatch(_ result: MatchResult) {
        if result == .draw {
            playGame()
        } else {
            print(Status.exit.message)
            return
        }
    }
    
    mutating func vertifyWinner(_ playerHand: Int,_ computerHand: Int ) -> MatchResult {
        if playerHand == computerHand {
            return .draw
        } else if playerHand - computerHand == 1 || computerHand - playerHand == 2 {
            return .win
        } else {
            return .lose
        }
    }
}
