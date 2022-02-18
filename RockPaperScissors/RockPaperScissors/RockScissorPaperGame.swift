//
//  RockScissorPaperGame.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/18.
//

import Foundation

class RockScissorPaperGame: GameData {
    
    func startGame() {
        displayInputMessage()
        
        let (playerOption, status) = convertToPlayerOption(from: inputPlayerOption())
        
        switch status {
        case .exit:
            print(Status.exit.statusMessage)
            break
        case .error:
            displayErrorMessage()
            startGame()
        case .inProgress:
            runByOption(of: makeResult(by: playerOption))
        default:
            startGame()
        }
    }
    
    func displayInputMessage() {
        print(Status.begin.statusMessage, terminator: "")
    }
    
    func runByOption(of matchResult: MatchResult) {
        displayMatchResult(matchResult)
        
        if matchResult == .sameHand {
            startGame()
        } else if matchResult == .playerWin {
            let mukjipa = MukjipaGame()
            mukjipa.turn = .playerTurn
            mukjipa.startGame()
        } else {
            let mukjipa = MukjipaGame()
            mukjipa.turn = .computerTurn
            mukjipa.startGame()
        }
    }
    
    func makeResult(by playerHand: PlayerHands) -> MatchResult {
        let computerHand = generateComputerHand()
        let matchResult = verifyWinner(by: playerHand.optionNumber, and: computerHand.optionNumber)
        return matchResult
    }
    
    func verifyWinner(by playerHand: Int,and computerHand: Int) -> MatchResult {
        if playerHand == computerHand {
            return .sameHand
        } else if playerHand - computerHand == 1 || computerHand - playerHand == 2 {
            return .playerWin
        } else {
            return .playerLose
        }
    }
    
    func displayMatchResult(_ matchResult: MatchResult) {
        print(matchResult.midtermMessage)
    }
    
    func displayErrorMessage() {
        print(Status.error.statusMessage)
    }
}

