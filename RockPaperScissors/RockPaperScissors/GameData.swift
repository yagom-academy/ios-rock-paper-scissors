//
//  GameData.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/18.
//

import Foundation

class GameData {
    
    func convertToPlayerOption(from playerOption: String) -> (PlayerHands, Status) {
        switch playerOption {
        case "1":
            return (.scissor, .inProgress)
        case "2":
            return (.rock, .inProgress)
        case "3":
            return (.paper, .inProgress)
        case "0":
            return (.none, .exit)
        default:
            return (.none, .error)
        }
    }
    
    func generateComputerHand() -> PlayerHands {
        let handsRange: ClosedRange = 1...3
        let computerOption = String(Int.random(in: handsRange))
        let (computerHand, _) = convertToPlayerOption(from: computerOption)
        return computerHand
    }
    
    func conveyPlayerHandAndStatus() -> (PlayerHands, Status) {
        let playerOption = inputPlayerOption()
        let (playerHand, status) = convertToPlayerOption(from: playerOption)
        return (playerHand, status)
    }
    
    func inputPlayerOption() -> String {
        guard let inputPlayerOption = readLine() else {
            return Status.error.statusMessage
        }
        return inputPlayerOption
    }
}
