//
//  RockScissorPaperGame.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/17.
//

import Foundation

class RockScissorPaperGame: GameData {
    
    func startGame() {
        displayInputMessage()
        let (playerOption, status) = convertToPlayerOption(from: inputPlayerOption())
        
        switch status {
        case .exit:
            print(Status.exit.message)
            break
        case .error:
            displayErrorMessage()
            startGame()
        case .inProgress:
            runByOption(makeResult(playerOption))
        default:
            startGame()
        }
    }
    
    func runByOption(_ matchResult: MatchResult) {
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
    
}

