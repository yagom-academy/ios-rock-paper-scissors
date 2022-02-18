//
//  MukjipaGame.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/17.
//

import Foundation

class MukjipaGame: RockScissorPaperGame {
    var turn: Turn = .playerTurn
    
    override func startGame() {
        displayInputMessage()
        let (playerOption, status) = convertToPlayerOption(from: inputPlayerOption())
        
        switch status {
        case .exit:
            print(Status.exit.message)
            break
        case .error:
            changeTurnByError()
            displayErrorMessage()
            startGame()
        case .inProgress:
            runByOption(makeResult(playerOption))
        default:
            startGame()
        }
    }
    
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
    
    func changeTurnByError() {
        turn = .computerTurn
    }

}
