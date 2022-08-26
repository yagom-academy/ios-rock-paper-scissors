//
//  step1.swift
//  RockPaperScissors
//
//  Created by 애종, Mangdi.
//

import Foundation

class RockScissorsPaperGame: CommonFunctions {
    enum RockScissorsPaper: Int, CaseIterable {
        case scissors = 1
        case rock = 2
        case paper = 3
    }

    func startGame() {
        var isExitGame: Bool = false

        while isExitGame == false {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")

            guard let userInput = filterUserInput() else { continue }
            
            if userInput == 0 {
                print("게임 종료")
                return
            }
            
            isExitGame = decideWhoStartsFirstTurn(with: userInput)
        }
    }

    func decideWhoStartsFirstTurn(with userChoice: Int) -> Bool {
        let computerPick = RockScissorsPaper.allCases.randomElement()
        let userPick = RockScissorsPaper(rawValue: userChoice)
        let comparisonOfTwoThings = (computerPick, userPick)
        let mcbGame = MukChiBbaGame()
        
        if computerPick == userPick {
            print("비겼습니다!")
            return false
        }
        
        switch comparisonOfTwoThings {
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            print("이겼습니다!")
            mcbGame.startMukChiBbaGame(isUserTurn: true)
        default:
            print("졌습니다!")
            mcbGame.startMukChiBbaGame(isUserTurn: false)
        }
        return true
    }
}

