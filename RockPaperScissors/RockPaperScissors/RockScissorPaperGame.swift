//
//  RockScissorPaperGame.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/16.
//

import Foundation

struct RockScissorPaperGame {
    var gameData = GameData()
    var matchResult: MatchResult = .draw
    
    mutating func playGame() {
        gameData.generateComputerHand()
        gameData.inputPlayerOption()
        executeByOption()
    }
    
    mutating func executeByOption() {
        if gameData.handsRange.contains(gameData.playerOption.optionNumber) {
            displayMatchResult()
            executeAfterMatch()
        } else if gameData.playerOption == PlayerOptions.exit {
            print(PlayerOptions.exit.printMassage)
            return
        } else {
            print(PlayerOptions.error.printMassage)
            playGame()
        }
    }
    
    mutating func displayMatchResult() {
        vertifyWinner(gameData.playerOption.optionNumber, gameData.computerHand)
        print(matchResult.printMessage)
    }
    
    mutating func executeAfterMatch() {
        if matchResult == .draw {
            playGame()
        } else {
            print(PlayerOptions.exit.printMassage)
            return
        }
    }
    
    mutating func vertifyWinner(_ playerHand: Int,_ computerHand: Int ) {
        if playerHand == computerHand {
            matchResult = .draw
        } else if playerHand - computerHand == 1 || computerHand - playerHand == 2 {
            matchResult = .win
        } else {
            matchResult = .lose
        }
    }
}
