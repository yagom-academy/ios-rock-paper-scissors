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
        let (playerHand, statuse) = gameData.inputPlayerOption()
        executeByOption(playerHand, computerHand, statuse)
    }
    
    mutating func executeByOption(_ playerHand: PlayerHands, _ computerHand: PlayerHands, _ statuse: Statuse) {
        if statuse == .exit {
            print(Statuse.exit.message)
            return
        } else if statuse == .error{
            print(Statuse.error.message)
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
            print(Statuse.exit.message)
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
