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
        rockSicssorPaperGame.playGame()
        changeTurn()
    }
    
    mutating func changeTurn() {
        var (_ , _ , status, result) = rockSicssorPaperGame.playGame()
        
        if result == .win {
            status = .playerTurn
            print("[사용자턴]")
        } else if result == .lose {
            status = .computerTurn
            print("[컴퓨터턴]")
        } else {
            status = .inProgress
        }
    }
}
