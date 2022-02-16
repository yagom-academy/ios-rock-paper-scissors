//
//  RockScissorPaperStep.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/15.
//

import Foundation

struct StoreGameData {
    var computerHand: Int = Int.zero
    var playerHand: Int = Int.zero
    let optionRange: ClosedRange = 1...3
    
    mutating func generateComputerHand() {
        computerHand = Int.random(in: optionRange)
    }
    
    mutating func inputPlayerOption() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
        guard let inputPlayerOption: String = readLine() else {
            return playerHand = 4
        }
        let convertedPlayerOption: Int = convertStringToInt(from: inputPlayerOption)
        playerHand = convertedPlayerOption
    }
    
    mutating func convertStringToInt(from playerOption: String) -> Int {
        guard let inputPlayerOption: Int = Int(playerOption) else {
            return 4 }
        return inputPlayerOption
    }
}
