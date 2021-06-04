//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum GameState: String{
    case userTurn = "사용자"
    case computerTurn = "컴퓨터"
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
        print("[\(whosTurn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: "")

        guard let input = readLine(),
              let value = Int(input),
              let usersHand = Hand(rawValue: value) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            whosTurn = .computerTurn
            return setUserHand()
        }
        
        return usersHand
    }

    func validateMatchBetween(userHand user: Hand, computerHand computer: Hand) -> GameState {
        var outcome: GameState
        
        if user == computer {
            outcome = .drawGame
        } else if (user == .muk && computer == .chi) ||
                    (user == .chi && computer == .bba) ||
                    (user == .bba && computer == .muk) {
            outcome = .userTurn
            print("\(outcome.rawValue)의 턴입니다")
        } else {
            outcome = .computerTurn
            print("\(outcome.rawValue)의 턴입니다")
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
            computerHand = .muk
        case 2:
            computerHand = .chi
        default:
            computerHand = .bba
        }
        
        return validateMatchBetween(userHand: userHand, computerHand: computerHand)
    }


    func startGame() -> GameState {
        guard whosTurn != .endGame else {
            return .endGame
        }
        
        var gameContinue = true
        var outcome = GameState.drawGame
        
        while gameContinue {
            let usersHand = setUserHand()
            outcome = matchOutcome(of: usersHand)
            
            if outcome == .drawGame {
                gameContinue = false
                print("\(whosTurn.rawValue)의 승리입니다")
            } else {
                whosTurn = outcome
                gameContinue = outcome != .endGame
            }
        }
        
        return outcome
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
            outcome = .computerTurn
        } else if user == computer {
            print("비겼습니다!")
            outcome = .drawGame
        } else {
            print("이겼습니다!")
            outcome = .userTurn
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
    
    func startGame() -> GameState {
        var gameContinue = true
        var outcome = GameState.drawGame
        
        while gameContinue {
            let myHand = setUserHand()
            outcome = matchOutcome(of: myHand)
            gameContinue = outcome == .drawGame
        }
        
        return outcome
    }
}

var gameContinue = true

while gameContinue {
    let winner = RockPaperScissors().startGame()
    let outcome = MukChiBba(prevWinner: winner).startGame()
    gameContinue = outcome != GameState.endGame
}
