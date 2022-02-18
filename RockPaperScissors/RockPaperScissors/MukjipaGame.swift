//
//  MukjipaGame.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/18.
//

import Foundation

final class MukjipaGame: RockScissorPaperGame {
    var turn: Turn = .playerTurn
    
    override func startGame() {
        displayInputMessage()
        
        let (playerOption, status) = convertToPlayerOption(from: inputPlayerOption())
        
        switch status {
        case .exit:
            print(Status.exit.statusMessage)
            break
        case .error:
            changeTurnByError()
            displayErrorMessage()
            startGame()
        case .inProgress:
            runByOption(of: makeResult(by: playerOption))
        default:
            startGame()
        }
    }
    
    override func runByOption(of matchResult: MatchResult) {
        if turn == .playerTurn && matchResult == .sameHand {
            displayMatchResult(MatchResult.playerWin)
            print(Status.exit.statusMessage)
        } else if turn == .computerTurn && matchResult == .sameHand {
            displayMatchResult(MatchResult.playerLose)
            print(Status.exit.statusMessage)
        } else {
            changeTurn(by: matchResult)
            startGame()
        }
    }
    
    override func displayInputMessage() {
        print(turn.inputMessage, terminator: "")
    }
    
    override func displayMatchResult(_ matchResult: MatchResult) {
        print(matchResult.finalMessage)
    }
    
    private func changeTurn(by result: MatchResult) {
        if result == .playerWin {
            turn = .playerTurn
            displayNotification(by: turn)
        } else if result == .playerLose {
            turn = .computerTurn
            displayNotification(by: turn)
        }
    }
    
    func displayNotification(by turn: Turn) {
        print(turn.notificationMessage)
    }
    
    private func changeTurnByError() {
        turn = .computerTurn
    }
}
