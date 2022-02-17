//
//  RockScissorPaperGame.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/17.
//

import Foundation

struct RockScissorPaperGame {
    var gameData = GameData()
    
    mutating func loadRockScissorPaperGame() -> (MatchResult, Status){
        print(Status.begin.message, terminator: "")
        let computerHand = gameData.generateComputerHand()
        let (playerHand, status) = gameData.conveyPlayerHandAndStatus()
        let result = executeByOption(playerHand, computerHand, status)
        return (result, status)
    }
    
    mutating func executeByOption(_ playerHand: PlayerHands, _ computerHand: PlayerHands, _ status: Status) -> MatchResult {
        switch status {
        case .exit:
            print(Status.exit.message)
            break
        case .error:
            print(Status.error.message)
            let _ = loadRockScissorPaperGame()
        default:
            var result = vertifyWinner(playerHand.optionNumber, computerHand.optionNumber)
            print("처음 verify 한 이후: \(result)")
            displayMatchResult(result)
            print("디스플레이한 이후: \(result)")
            executeAfterMatch(&result)
            print("애프터 매치: \(result)")
            return result
        }
        return .draw
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
    
    mutating func displayMatchResult(_ result: MatchResult) {
        print(result.message)
    }
    
    mutating func executeAfterMatch(_ result: inout MatchResult) {
        if result == .draw {
            let (newResult, _) = loadRockScissorPaperGame()
           result = newResult
        }
    }
}

