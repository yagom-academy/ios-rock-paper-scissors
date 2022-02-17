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
        changeTurn()
        verifyWinner()
    }
    
    mutating func changeTurn() {
        var (_ , _ , status, result) = rockSicssorPaperGame.playGame()
        
        if result == .win {
            status = .playerTurn
            print(Status.playerTurn.message)
        } else if result == .lose {
            status = .computerTurn
            print(Status.computerTurn.message)
        } else {
            status = .inProgress
        }
    }
    
    mutating func verifyWinner() {
        var (_ , _ , status, result) = rockSicssorPaperGame.playGame()
        
        if status == .playerTurn && result == .draw {
            print("사용자의 승리!")
        } else if status == .computerTurn && result == .draw {
            print("컴퓨터의 승리!")
        } else {
            return
        }
    }
}
