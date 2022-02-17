//
//  RockScissorPaperGame.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/17.
//

import Foundation

struct RockScissorPaperGame {
    var gameData = GameData()
    var status: Status = .begin
    
    mutating func playGame() -> (Status, MatchResult?) {
        let (playerHand, computerHand) = makeHands()
        let result = vertifyWinner(playerHand.optionNumber, computerHand.optionNumber)
        return (status, result)
    }
    
    mutating func makeHands() -> (PlayerHands, PlayerHands) {
        let computerHand = gameData.generateComputerHand()
        let (playerHand, nowStatus) = gameData.conveyPlayerHandAndStatus()
        status = nowStatus
        return (playerHand, computerHand)
    }
    
//    mutating func executeByOption(_ playerHand: PlayerHands, _ computerHand: PlayerHands, _ status: Status) -> MatchResult? {
//        if status == .exit {
//            print(Status.exit.message)
//            return nil
//        } else if status == .error{
//            print(Status.error.message)
//            playGame()
//            return nil
//        } else {
//            let result = vertifyWinner(playerHand.optionNumber, computerHand.optionNumber)
//            displayMatchResult(result)
//            executeAfterMatch(result)
//            return result
//        }
//    }
    
    mutating func displayMatchResult(_ result: MatchResult) {
        print(result.message)
    }
    
    mutating func executeAfterMatch(_ result: MatchResult) {
        if result == .drawInRockScissorPaperGame {
            playGame()
        } else {
            return
        }
    }
    
    mutating func vertifyWinner(_ playerHand: Int,_ computerHand: Int ) -> MatchResult {
        if playerHand == computerHand {
            return .drawInRockScissorPaperGame
        } else if playerHand - computerHand == 1 || computerHand - playerHand == 2 {
            return .win
        } else {
            return .lose
        }
    }
}
