//
//  GameData.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/16.
//

import Foundation

struct GameData {
//    var computerHand: Int
//    var playerOption: PlayerOptions
    let handsRange: ClosedRange = 1...3
    
    
    mutating func generateComputerHand() -> Int {
        return Int.random(in: handsRange)
    }
    
    mutating func inputPlayerOption() -> PlayerOptions {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let inputPlayerOption = readLine() else {
            return PlayerOptions.error
        }
        return convertToPlayerOption(from: inputPlayerOption)
    }
    
    func convertToPlayerOption(from playerOption: String ) -> PlayerOptions {
        switch playerOption {
        case "0":
            return .exit
        case "1":
            return .scissor
        case "2":
            return .rock
        case "3":
            return .paper
        default:
            return .error
        }
    }
}
