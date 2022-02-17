//
//  RockScissorPaperGame.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/17.
//

import Foundation

class RockScissorPaperGame: GameData {
    
    override func runByOption(_ matchResult: MatchResult) {
        displayMatchResult(matchResult)
        if matchResult == .draw {
            startGame()
        } else if matchResult == .win {
            let mukjipa = MukjipaGame()
            mukjipa.turn = .playerTurn
            mukjipa.startGame()
        } else {
            let mukjipa = MukjipaGame()
            mukjipa.turn = .computerTurn
            mukjipa.startGame()
        }
    }
    
    override func displayMatchResult(_ matchResult: MatchResult) {
        print(matchResult.midtermMessage)
    }
}

