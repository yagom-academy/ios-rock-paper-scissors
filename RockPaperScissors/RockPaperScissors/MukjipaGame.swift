//
//  MukjipaGame.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/17.
//

import Foundation

class MukjipaGame: GameData  {
    var turn: Turn = .playerTurn
    
    override func runByOption(_ matchResult: MatchResult) {
        if turn == .playerTurn && matchResult == .draw {
            displayMatchResult(MatchResult.win)
            print(Status.exit.message)
        } else if turn == .computerTurn && matchResult == .draw  {
            displayMatchResult(MatchResult.lose)
            print(Status.exit.message)
        } else {
            changeTurn(matchResult)
            startGame()
        }
    }
    
    override func displayInputMessage() {
        print(turn.inputMessage, terminator: "")
    }
    
    override func displayMatchResult(_ matchResult: MatchResult) {
        print(matchResult.finalMessage)
    }
    
    func changeTurn(_ result: MatchResult ) {
        if result == .win {
            turn = .playerTurn
            print(turn.notificationMessage)
        } else if result == .lose {
            turn = .computerTurn
            print(turn.notificationMessage)
        }
    }
    
    override func changeTurnByError() {
        turn = .computerTurn
        print(Status.error.message)
    }

}
