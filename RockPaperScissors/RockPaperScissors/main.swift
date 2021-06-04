//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum GameState {
    case userWin
    case computerWin
    case drawGame
    case endGame
}


class MukChiBba {
    
    enum Hand: Int {
        case stopGame = 0
        case muk = 1
        case chi = 2
        case bba = 3
    }
    
    var whosTurn: GameState
    
    init(prevWinner: GameState) {
        whosTurn = prevWinner
    }
    
    func setUserHand() -> Hand {
        print("[\(whosTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: "")
        
        guard let input = readLine(),
              let value = Int(input),
              let usersHand = Hand(rawValue: value) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return setUserHand()
        }
        
        return usersHand
    }
    
    func validateMatchBetween(userHand user: Hand, computerHand computer: Hand) -> GameState {
        
        var outcome: GameState
        
        if user == computer {
            outcome = whosTurn
        } else if whosTurn == .computerWin {
            outcome = .userWin
        } else {
            outcome = .computerWin
        }
        return outcome
    }
    
    func matchOutcome(of userHand: Hand) -> GameState {
        
    }
    
    
    func gameStart() {
        guard whosTurn != .endGame else {
            return
        }
        var gameContinue = true
        while gameContinue {
            gameContinue = true
        }
    }
    
    
}

class RockPaperScissors {
    
    enum Hand: Int {
        case stopGame = 0
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    
    func setUserHand() -> Hand {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")

        guard let input = readLine(),
              let value = Int(input),
              let usersHand = Hand(rawValue: value) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return setUserHand()
        }

        return usersHand
    }
    
    
    func validateMatchBetween(userHand user: Hand, computerHand computer: Hand) -> GameState {
        
        var outcome: GameState
        
        if (user == .scissors && computer == .rock) ||
            (user == .rock && computer == .paper) ||
            (user == .paper && computer == .scissors) {
            print("졌습니다!")
            outcome = .computerWin
        } else if user == computer {
            print("비겼습니다!")
            outcome = .drawGame
        } else {
            print("이겼습니다!")
            outcome = .userWin
        }
        
        return outcome
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
        
        return validateMatchBetween(userHand: userHand, computerHand: computerHand)
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
