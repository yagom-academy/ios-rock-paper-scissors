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
    
    var isGameOver: Bool = false

    func startGame() {
        while isGameOver == false {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")

            guard let userInput = filterUserInput() else { continue }
            
            if userInput == 0 {
                print("게임 종료")
                return
            }
            decideWhoStartsFirstTurn(with: userInput)
        }
    }

    func decideWhoStartsFirstTurn(with userChoice: Int) {
        let computerPick = RockScissorsPaper.allCases.randomElement()
        let userPick = RockScissorsPaper(rawValue: userChoice)
        let comparisonOfTwoPicks = (computerPick, userPick)
        let mcbGame = MukChiBbaGame()
        
        if computerPick == userPick {
            print("비겼습니다!")
            isGameOver = false
            return
        }
        
        switch comparisonOfTwoPicks {
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            print("이겼습니다!")
            mcbGame.startMukChiBbaGame(turn: Player.user)
        default:
            print("졌습니다!")
            mcbGame.startMukChiBbaGame(turn: Player.computer)
        }
        isGameOver = true
    }
}

