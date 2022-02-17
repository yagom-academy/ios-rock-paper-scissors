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
        let (status, result) = rockSicssorPaperGame.playGame()
        verifyWinner(changeTurn(), result)
    }
    
    mutating func changeTurn() -> MatchResult {
        let (_ , result) = rockSicssorPaperGame.playGame()
        var turn: MatchResult = .playerTurn
        if result == .win {
            turn = .playerTurn
        } else if result == .lose {
            turn = .computerTurn
        } else {
            
        }
        return turn
    }
    
    mutating func verifyWinner(_ turn: MatchResult, _ result: MatchResult?) {
        let ( _ , result) = rockSicssorPaperGame.playGame()
        
        if result == .win && turn == .playerTurn {
            print(MatchResult.win.message)
        } else if result == .lose && turn == .computerTurn {
            print(MatchResult.lose.message)
        } else {
            main()
        }
    }
}
