//
//  MukjipaGame.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/17.
//

import Foundation

struct MukjipaGame {
    var rockSicssorPaperGame = RockScissorPaperGame()
    let gameData = GameData()
    
    mutating func main() {
//        changeTurn()
        verifyWinner()
    }
    
//    mutating func changeTurn() {
//        var (_ , _ , _ , result) = rockSicssorPaperGame.playGame()
//
//        if result == .playerTurn {
//
//        } else if result == .lose {
//        } else {
//            status = .inProgress
//        }
//    }
    
    mutating func verifyWinner() {
        let (playerHand , computerHand , _ , result) = rockSicssorPaperGame.playGame()
        
        if result == .playerTurn && playerHand == computerHand {
            print(MatchResult.win.message)
        } else if result == .computerTurn && playerHand == computerHand {
            print(MatchResult.lose.message)
        } else {
            rockSicssorPaperGame.executeByOption(playerHand, computerHand, Status.inProgress)
        }
    }
}
