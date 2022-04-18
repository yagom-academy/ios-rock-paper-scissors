//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by NAMU on 2022/04/18.
//

import Foundation

struct RockPaperScissorsGame {
    var inputNumber: Int?
    let computerNumber = Int.random(in: 1...3)

    mutating func inputUserSelect() {
        inputNumber = Int(readLine() ?? "") ?? 4
    }
    
    func verifyUserSelection() -> Bool {
        switch inputNumber {
        case convertUserChoiceToNumber(.end),
            convertUserChoiceToNumber(.scissors),
            convertUserChoiceToNumber(.rock),
            convertUserChoiceToNumber(.paper):
            return true
        default:
            return false
        }
    }
    
    func convertUserChoiceToNumber(_ userchoice: UserChoice) -> Int {
        return userchoice.rawValue
    }
    
    func printGameMessage(_ gameMessage: GameMessage) {
        print(gameMessage.rawValue)
    }
    
    func decideGameStart() -> Bool {
        if let number = inputNumber, number > convertUserChoiceToNumber(.end) {
            return true
        }
        return false
    }
    
    mutating func excuteRockPaperScissors() {
        while true {
            printGameMessage(.menu)
            inputUserSelect()
            if verifyUserSelection() {
                if decideGameStart() {
//                    compareNumbers()
                } else {
                    printGameMessage(.ending)
                    break
                }
            } else {
                printGameMessage(.error)
            }
        }
    }
}
