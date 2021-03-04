//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissorsHand: Int {
    case scissor = 1
    case rock = 2
    case paper = 3
    case finish = 0
}

class RockPaperScissorsGame {
    private var userHand: RockPaperScissorsHand?
    private var computerHand: RockPaperScissorsHand?
    
    private func getIntHands() {
        while true {
            computerHand = RockPaperScissorsHand(rawValue: Int.random(in: 1...3))
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator:"")
            if let inputUserNumber = readLine() {
                if isValidUserNumber(inputUserNumber) {
                    convertStringToInt(inputUserNumber)
                    break
                }
            }
        }
    }
    
    private func isValidUserNumber(_ userNumber: String) -> Bool {
        switch userNumber {
        case "0", "1", "2", "3":
            return true
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return false
        }
    }
    
    private func convertStringToInt(_ stringUserNumber: String) {
        if let intUserNumber = Int(stringUserNumber) {
            userHand = RockPaperScissorsHand(rawValue: intUserNumber)
        }
    }
    
    private func gameResult() {
        if userHand == computerHand {
            print("비겼습니다")
            start()
        } else if userHand == RockPaperScissorsHand.finish {
            finishGame()
        } else {
            if let computerHand = computerHand {
                judgeHand(hand: computerHand)
            }
        }
    }
    
    private func judgeHand(hand: RockPaperScissorsHand) {
        switch hand {
        case .scissor:
            if userHand == RockPaperScissorsHand.rock { print("이겼습니다!") }
            else if userHand == RockPaperScissorsHand.paper { print("졌습니다!") }
        case .rock:
            if userHand == RockPaperScissorsHand.paper { print("이겼습니다!") }
            else if userHand == RockPaperScissorsHand.scissor { print("졌습니다!") }
        default:
            if userHand == RockPaperScissorsHand.scissor { print("이겼습니다!") }
            else if userHand == RockPaperScissorsHand.rock { print("졌습니다!") }
        }
    }
    
    private func finishGame() {
        print("게임종료")
    }
    
    func start() {
        getIntHands()
        gameResult()
    }
}

let game = RockPaperScissorsGame()
game.start()
