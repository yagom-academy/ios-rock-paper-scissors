//
//  RockScissorPaperStep.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/15.
//

import Foundation

struct RockScissorPaper {
    var computerHand: Int
    var playerHand: Int
    let optionRange = 1...3
    
    mutating func generateComputerHand() {
        computerHand = Int.random(in: optionRange)
    }
    
    mutating func inputPlayerOption() {
        guard let inputPlayerHand: String = readLine() else { return }
        convertStringToInt(to: inputPlayerHand)
    }
    
    mutating func convertStringToInt(to: String) {
        if let inputPlayerHand: Int = Int(to) {
            playerHand = inputPlayerHand
        } else { print("잘못된 입력입니다. 다시 시도해 주세요.") }
    }
}
