//
//  RockScissorPaperStep.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/15.
//

import Foundation

enum ErrorCase: Error {
    case valueIsWorngFormat
    case valueIsOverRange
}

struct StoreGameData {
    var computerHand: Int = Int.zero
    var playerHand: Int = Int.zero
    let optionRange: ClosedRange = 1...3
    
    mutating func generateComputerHand() -> Int {
        computerHand = Int.random(in: optionRange)
        return computerHand
    }
    
    mutating func inputPlayerOption() throws -> Int {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
        guard let inputPlayerOption: String = readLine() else { throw ErrorCase.valueIsWorngFormat }
        let convertedPlayerOption: Int = try convertStringToInt(from: inputPlayerOption)
        let validPlayerOption = try checkValidOption(with: convertedPlayerOption)
        return validPlayerOption
    }
    
    mutating func convertStringToInt(from playerOption: String) throws -> Int {
        guard let inputPlayerOption: Int = Int(playerOption) else { throw ErrorCase.valueIsWorngFormat }
        return inputPlayerOption
    }
    
    mutating func checkValidOption(with playerOption: Int) throws -> Int {
        guard optionRange.contains(playerOption) else { throw ErrorCase.valueIsOverRange }
        return playerOption
    }
}
