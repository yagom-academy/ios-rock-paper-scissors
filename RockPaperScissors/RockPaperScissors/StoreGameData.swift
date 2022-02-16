//
//  RockScissorPaperStep.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/15.
//

import Foundation

struct StoreGameData {
    var computerHand: Int = 0
    var playerHand: CaseOfOptions = .scissor
    let optionRange: ClosedRange = 1...3
    
    mutating func generateComputerHand() {
        computerHand = Int.random(in: optionRange)
    }
    
    mutating func inputPlayerOption() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
        guard let inputPlayerOption: String = readLine() else {
            return playerHand = CaseOfOptions.error
        }
        playerHand = convertStringToOption(inputPlayerOption)
    }
    
    func convertStringToOption(_ playerOption: String ) -> CaseOfOptions {
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
