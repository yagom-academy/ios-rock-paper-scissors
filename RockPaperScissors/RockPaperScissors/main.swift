//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class MukChiBaGame {
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
    
    private func print(gameMessage: GameMessage) {
        switch gameMessage {
        case .menu:
            Swift.print(gameMessage.rawValue, terminator: "")
        default:
            Swift.print(gameMessage.rawValue)
        }
    }
    
    private func finishGame(withMessage message: GameMessage) {
        print(gameMessage: message)
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
            finishGame(withMessage: .exit)
        case 1...3:
            return true
        default: break
        }
        
        return false
    }
    
    private func getGameResult() -> GameResult {
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
    
    private func gameResultHandling(_ gameResult: GameResult) {
        switch gameResult {
        case .draw:
            print(gameMessage: .draw)
            startGame()
        case .lose:
            finishGame(withMessage: .lose)
        case .win:
            finishGame(withMessage: .win)
        }
    }
    
    func startGame() {
        computerAnswer = castedHand(from: generatedRandomAnswer())
        while true {
            print(gameMessage: .menu)
            let userInput: String? = readLine()
            
            if false == isValidUserAnswer(userInput) {
                print(gameMessage: .error)
                continue
            }
            userAnswer = castedHand(from: castedInteger(from: userInput))
            gameResultHandling(getGameResult())
        }
    }
}

MukChiBaGame().startGame()
