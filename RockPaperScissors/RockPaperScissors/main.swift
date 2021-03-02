//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

public class MukChiBaGame {
    private var computerAnswer: Hand = .rock
    private var userAnswer: Hand = .rock
    private enum GameResult {
        case draw, win, lose
    }
    private enum Hand: Int {
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    private enum GameMessage: String {
        case menu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        case exit = "게임 종료"
        case error = "잘못된 입력입니다. 다시 시도해주세요."
        case draw = "비겼습니다!"
        case win = "이겼습니다!"
        case lose = "졌습니다!"
    }
    
    private func generatedRandomAnswer() -> Int {
        return Int.random(in: 1...3)
    }
    
    private func castedHand(from number: Int) -> Hand {
         return Hand(rawValue: number) ?? .rock
    }
    
    private func printGameMessage(_ message: GameMessage) {
        switch message {
        case .menu:
            print(message.rawValue, terminator: "")
        default:
            print(message.rawValue)
        }
    }
    
    private func exitGame(withMessage message: GameMessage) {
        print(message.rawValue)
        exit(0)
    }
    
    private func castedInteger(from input: String?) -> Int {
        guard let _input: String = input else { return -1 }
        guard let result: Int = Int(_input) else { return -1 }
        
        return result
    }
    
    private func isValidUserAnswer(_ userInput: String?) -> Bool {
        let userAnswer: Int = castedInteger(from: userInput)
        
        if userAnswer == -1 { return false }
        
        switch userAnswer {
        case 0:
            exitGame(withMessage: .exit)
        case 1...3:
            return true
        default: break
        }
        
        return false
    }
    
    private func checkGameResult() -> GameResult {
        if userAnswer == .scissors {
            if computerAnswer == .paper {
                return .win
            } else if computerAnswer == .rock {
                return .lose
            }
        } else if userAnswer == .rock {
            if computerAnswer == .scissors {
                return .win
            } else if computerAnswer == .paper {
                return .lose
            }
            
        } else if userAnswer == .paper {
            if computerAnswer == .rock {
                return .win
            } else if computerAnswer == .scissors {
                return .lose
            }
        }
        
        return .draw
    }
    
    public func startGame() {
        computerAnswer = castedHand(from: generatedRandomAnswer())
        while true {
            printGameMessage(.menu)
            let userInput: String? = readLine()
            
            if !isValidUserAnswer(userInput) {
                printGameMessage(.error)
                continue
            }
            userAnswer = castedHand(from: castedInteger(from: userInput))
            
        }
    }
    
}

MukChiBaGame().startGame()
