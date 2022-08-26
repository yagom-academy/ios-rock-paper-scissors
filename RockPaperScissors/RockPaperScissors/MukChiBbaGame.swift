//
//  MukChiBbaGame.swift
//  RockPaperScissors
//
//  Created by 애종, Mangdi.
//

import Foundation

class MukChiBbaGame: CommonFunctions {
    enum MukChiBba: Int, CaseIterable {
        case muk = 1
        case chi = 2
        case bba = 3
    }

    func startMukChiBbaGame(isUserTurn: Bool) {
        var isExitGame: Bool = false
        var isUserTurn = isUserTurn
        var mukChiBbaAttacker: String {
            get {
                isUserTurn ? "사용자" : "컴퓨터"
            }
        }
        
        while isExitGame == false {
            print("[\(mukChiBbaAttacker) 턴] (묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
            
            guard let userInput = filterUserInput() else {
                isUserTurn = false
                continue
            }
            
            let isExitOrWhoseTurn: (canExit: Bool, checkUserTurn: Bool) = decideWhoWins(userInput: userInput, isUserTurn: isUserTurn)
            
            switch isExitOrWhoseTurn {
            case (canExit: true, _):
                isExitGame = true
            case (canExit: false, checkUserTurn: false):
                isUserTurn = false
            case (canExit: false, checkUserTurn: true):
                isUserTurn = true
            }
        }
    }

    func decideWhoWins(userInput: Int, isUserTurn: Bool) -> (Bool,Bool) {
        let computerPick = MukChiBba.allCases.randomElement()
        let userPick = MukChiBba(rawValue: userInput)
        let comparisonOfTwoThings = (computerPick, userPick)
        
        if userInput == 0 {
            print("게임 종료")
            return (true, isUserTurn)
        } else if computerPick == userPick && isUserTurn == true {
            print("사용자의 승리!")
            return (true, isUserTurn)
        } else if computerPick == userPick && isUserTurn == false {
            print("컴퓨터의 승리!")
            return (true, isUserTurn)
        }
        
        switch comparisonOfTwoThings {
        case (.muk, .bba), (.chi, .muk), (.bba, .chi):
            return (false, true)
        default:
            return (false, false)
        }
    }
}
