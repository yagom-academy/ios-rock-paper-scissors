//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class RPS {
    
    enum Hand : Int {
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    
    enum GameState: Int {
        case continueGame = 1
        case endGame = 0
        case errorGame = -1
    }
    
    var usersHand = Hand.rock
    
    func userInput() -> Int {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let input = Int(readLine() ?? "") , input >= 0 && input <= 3 else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return userInput()
        }
        
        return input
    }
    
    func convertInput(hand userHand: Int) -> Hand? {
        switch userHand {
        case 1, 2, 3:
            return Hand(rawValue: userHand)
        default:
            return nil
        }
    }
    
    func matchOutcome(hand userHand: Hand?) -> GameState {
        guard let hand: Hand = userHand else {
            return GameState.errorGame
        }
        let computerHand = Hand(rawValue: Int.random(in: 1...3))
        if  (hand == Hand.scissors && computerHand == Hand.rock) ||
            (hand == Hand.rock && computerHand == Hand.paper) ||
            (hand == Hand.paper && computerHand == Hand.scissors) {
            print("졌습니다!")
        } else {
            print("이겼습니다!")
        }
        
        return GameState.continueGame
    }
    
    func startGame() {
        var gameContinue = true
        while gameContinue {
            var userInput = userInput()
            var userHand = convertInput(hand: userInput)
            gameContinue = userHand == nil
        }
    }
    
    
    
}
