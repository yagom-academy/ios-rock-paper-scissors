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
    let outcomesForRock: Array<String> = ["승", "무승부", "패"]
    let outcomesForScissor: Array<String> = ["무승부", "패", "승"]
    let outcomesForPaper: Array<String> = ["패", "승", "무승부"]
    
    func vertifyWinner(_ playerHand: Int,_ computerHand: Int ) -> String {
        var result: String = ""
        switch playerHand {
        case 1:
            result = outcomesForScissor[computerHand-1]
        case 2:
            result = outcomesForRock[computerHand-1]
        case 3:
            result = outcomesForPaper[computerHand-1]
        default:
            break
        }
        return result
    }
    
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
