//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class RockPaperScissors {
    enum Hand: Int {
        case stopGame = 0
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    
    enum GameState {
        case userWin
        case computerWin
        case drawGame
        case endGame
    }
    
    func setUsersHand() -> Hand {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")

        guard let input = readLine(),
              let value = Int(input),
              let usersHand = Hand(rawValue: value) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return setUsersHand()
        }

        return usersHand
    }
    
    func step2SetUserHand() -> Hand {
        print("[*** 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :")
        
    }
    
    func matchOutcome(of userHand: Hand) -> GameState {
        guard userHand != .stopGame else {
            return .endGame
        }
        
        var computerHand: Hand
        
        switch Int.random(in: 1...3) {
        case 1:
            computerHand = .scissors
        case 2:
            computerHand = .rock
        default:
            computerHand = .paper
        }
        
        var outcome: GameState
        
        if (userHand == .scissors && computerHand == .rock) ||
            (userHand == .rock && computerHand == .paper) ||
            (userHand == .paper && computerHand == .scissors) {
            print("졌습니다!")
            outcome = .computerWin
        } else if userHand == computerHand {
            print("비겼습니다!")
            outcome = .drawGame
        } else {
            print("이겼습니다!")
            outcome = .userWin
        }
        
        return outcome
    }
    
    func startGame() {
        var gameContinue = true
        
        while gameContinue {
            let myHand = setUsersHand()
            let outcome = matchOutcome(of: myHand)
            
            gameContinue = outcome == .continueGame
        }
    }
}

RockPaperScissors().startGame()
