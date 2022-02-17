//
//  RockScissorPaperGame.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/17.
//

import Foundation

struct RockScissorPaperGame {
    var gameData = GameData()
    
    mutating func playGame() -> (PlayerHands, PlayerHands, Status, MatchResult?){
        let computerHand = gameData.generateComputerHand()
        let (playerHand, status) = gameData.conveyPlayerHandAndStatus()
        let result = executeByOption(playerHand, computerHand, status)
        return ( playerHand, computerHand, status, result )
    }
    
    mutating func executeByOption(_ playerHand: PlayerHands, _ computerHand: PlayerHands, _ status: Status) -> MatchResult? {
        if status == .exit {
            print(Status.exit.message)
            return nil
        } else if status == .error{
            print(Status.error.message)
            playGame()
            return nil
        } else {
            let result = vertifyWinner(playerHand.optionNumber, computerHand.optionNumber)
            displayMatchResult(result)
            executeAfterMatch(result)
            return result
        }
    }
    
    mutating func displayMatchResult(_ result: MatchResult) {
        print(result.message)
    }
    
    mutating func executeAfterMatch(_ result: MatchResult) {
        if result == .draw {
            playGame()
        } else {
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
