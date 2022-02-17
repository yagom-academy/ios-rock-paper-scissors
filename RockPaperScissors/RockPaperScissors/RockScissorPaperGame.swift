//
//  RockScissorPaperGame.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/17.
//

import Foundation

class RockScissorPaperGame: GameData {
    var gameData = GameData()
    
    func loadRockScissorPaperGame() -> (MatchResult, Status) {
        print(Status.begin.message, terminator: "")
        let computerHand = gameData.generateComputerHand()
        let (playerHand, status) = gameData.conveyPlayerHandAndStatus()
        let result = executeByOption(playerHand, computerHand, status)
        return (result, status)
    }
    
    func executeByOption(_ playerHand: PlayerHands, _ computerHand: PlayerHands, _ status: Status) -> MatchResult {
        switch status {
        case .exit:
            print(Status.exit.message)
            break
        case .error:
            print(Status.error.message)
            let _ = loadRockScissorPaperGame()
        default:
            var result = vertifyWinner(playerHand.optionNumber, computerHand.optionNumber)
            displayMatchResult(result)
            executeAfterMatch(&result)
            return result
        }
        return .draw
    }

    func vertifyWinner(_ playerHand: Int,_ computerHand: Int ) -> MatchResult {
        if playerHand == computerHand {
            return .draw
        } else if playerHand - computerHand == 1 || computerHand - playerHand == 2 {
            return .win
        } else {
            return .lose
        }
    }
    
    func displayMatchResult(_ result: MatchResult) {
        print(result.message)
    }
    
    func executeAfterMatch(_ result: inout MatchResult) {
        if result == .draw {
            let (newResult, _) = loadRockScissorPaperGame()
           result = newResult
        }
    }
}

