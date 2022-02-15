//
//  RockScissorPaperStep.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/15.
//

import Foundation

enum ErrorCase: Error {
    case valueIsWorngFormat
}

struct RockScissorPaper {
    var computerHand: Int
    var playerHand: Int
    let optionRange = 1...3
    let outcomesForRock: Array<String> = ["승", "무승부", "패"]
    let outcomesForScissor: Array<String> = ["무승부", "패", "승"]
    let outcomesForPaper: Array<String> = ["패", "승", "무승부"]
    
    mutating func startGame() {
        do {
            try inputPlayerOption()
        } catch ErrorCase.valueIsWorngFormat {
            print("잘못된 입력 입니다. 다시 시도해 주세요.")
        } catch{}
    }
    
    mutating func generateComputerHand() {
        computerHand = Int.random(in: optionRange)
    }
    
    mutating func inputPlayerOption() throws {
        while true {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
            guard let inputPlayerHand: String = readLine() else { throw ErrorCase.valueIsWorngFormat }
            let convertedPlayerHand: Int = try convertStringToInt(to: inputPlayerHand)
            switch convertedPlayerHand {
            case 1:
                playerHand = 1
            case 2:
                playerHand = 2
            case 3:
                playerHand = 3
            case 0:
                return
            default:
                throw ErrorCase.valueIsWorngFormat
            }
        }
    }
    
    mutating func convertStringToInt(to: String) throws -> Int {
        guard let inputPlayerHand: Int = Int(to) else { throw ErrorCase.valueIsWorngFormat }
        return inputPlayerHand
    }
    
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
}
