//
//  MukjipaGame.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/17.
//

import Foundation

class MukjipaGame: GameData  {
    var turn: Turn = .playerTurn
    
    override func executeByOption(_ matchResult: MatchResult) {
        if turn == .playerTurn && matchResult == .draw {
            print(MatchResult.win.finalMessage)
        } else if turn == .computerTurn && matchResult == .draw  {
            print(MatchResult.lose.finalMessage)
        } else {
            changeTurn(matchResult)
            startGame()
        }
        
    }
    override func displayMention() {
        print(turn.inputMessage, terminator: "")
    }
    
    func changeTurn(_ result: MatchResult ) {
        if result == .win {
            turn = .playerTurn
        } else if result == .lose {
            turn = .computerTurn
        } else {}
    }
    
    override func forceTurnChange() {
        turn = .computerTurn
        print(Status.error.message)
    }

}
