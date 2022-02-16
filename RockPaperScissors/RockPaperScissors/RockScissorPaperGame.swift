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
        let playerHand = gameData.inputPlayerOption()
        executeByOption(playerHand, computerHand)
    }
    
    mutating func executeByOption(_ playerHand: PlayerOptions, _ computerHand: Int) {
        if gameData.handsRange.contains(playerHand.optionNumber) {
            let result = vertifyWinner(playerHand.optionNumber, computerHand)
            displayMatchResult(result)
            executeAfterMatch(result)
        } else if playerHand == PlayerOptions.exit {
            print(PlayerOptions.exit.message)
            return
        } else {
            print(PlayerOptions.error.message)
            playGame()
        }
    }
    
    mutating func displayMatchResult(_ result: MatchResult) {
        print(result.message)
    }
    
    mutating func executeAfterMatch(_ result: MatchResult) {
        if result == .draw {
            playGame()
        } else {
            print(PlayerOptions.exit.message)
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
