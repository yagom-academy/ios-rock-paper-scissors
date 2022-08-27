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
    
    var isGameOver: Bool = false
    var attacker: Player = Player.user

    func startMukChiBbaGame(turn: Player) {
        attacker = turn
        
        while isGameOver == false {
            print("[\(attacker.rawValue) 턴] (묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
            
            guard let userInput = filterUserInput() else {
                attacker = Player.computer
                continue
            }
            
            if userInput == 0 {
                print("게임 종료")
                return
            }
            
            decideWhoWins(userInput: userInput, turn: attacker)
        }
    }

    func decideWhoWins(userInput: Int, turn: Player) {
        guard let computerPick = MukChiBba.allCases.randomElement(),
              let userPick = MukChiBba(rawValue: userInput) else { return }
        
        if computerPick == userPick && turn == Player.user {
            print("사용자의 승리!")
            isGameOver = true
        } else if computerPick == userPick && turn == Player.computer {
            print("컴퓨터의 승리!")
            isGameOver = true
        } else {
            decideWhoseTurn((computerPick, userPick))
        }
    }
    
    func decideWhoseTurn(_ comparisonOfTwoPicks: (MukChiBba, MukChiBba)) {
        switch comparisonOfTwoPicks {
        case (.muk, .bba), (.chi, .muk), (.bba, .chi):
            attacker = Player.user
        default:
            attacker = Player.computer
        }
    }
}
