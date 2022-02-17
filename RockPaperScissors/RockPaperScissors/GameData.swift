//
//  GameData.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/17.
//

import Foundation

struct GameData {
    let handsRange: ClosedRange = 1...3
    
    mutating func generateComputerHand() -> PlayerHands {
        let computerOption = String(Int.random(in: handsRange))
        let (computerHand, _) = convertToPlayerOption(from: computerOption)
        return computerHand
    }
    
    mutating func conveyPlayerHandAndStatus() -> (PlayerHands, Status) {
        let playerOption = inputPlayerOption()
        let (playerHand, status) = convertToPlayerOption(from: playerOption)
        return (playerHand, status)
    }
    
    mutating func inputPlayerOption() -> String {
//        print(Status.begin.message, terminator: "")
        guard let inputPlayerOption = readLine() else {
            return "error"
        }
        return inputPlayerOption
    }
    
    mutating func convertToPlayerOption(from playerOption: String ) -> (PlayerHands, Status) {
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
}
