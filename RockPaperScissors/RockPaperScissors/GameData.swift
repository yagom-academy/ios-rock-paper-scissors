//
//  GameData.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/16.
//

import Foundation

struct GameData {
    let handsRange: ClosedRange = 1...3
    
    mutating func generateComputerHand() -> PlayerHands {
        let computerRange = String(Int.random(in: handsRange))
        return convertToPlayerOption(from: computerRange)
    }
    
    mutating func inputPlayerOption() -> (PlayerHands, Statuse) {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let inputPlayerOption = readLine() else {
            return (PlayerHands.none, Statuse.error)
        }
        return (convertToPlayerOption(from: inputPlayerOption), Statuse.inProgress)
    }
    
    func convertToPlayerOption(from playerOption: String ) -> PlayerHands {
        switch playerOption {
        case "1":
            return .scissor
        case "2":
            return .rock
        case "3":
            return .paper
        default:
            return .none
        }
    }
}
