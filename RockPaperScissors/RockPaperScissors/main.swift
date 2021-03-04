//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class MukChiBaGame {
    private var computerAnswer: Hand?
    private var userAnswer: Hand?
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
        case finish = "게임 종료"
        case invalidHandError = "잘못된 입력입니다. 다시 시도해주세요."
        case draw = "비겼습니다!"
        case win = "이겼습니다!"
        case lose = "졌습니다!"
    }
    private enum GameError: Error {
        case invalidHand
    }
    
    private func generatedRandomAnswer() -> Int {
        return Int.random(in: 1...3)
    }
    
    private func castedHand(from possibleText: String?) throws -> Hand {
        guard let text: String = possibleText else {
            throw GameError.invalidHand
        }
        guard let possibleHand: Int = Int(text) else {
            throw GameError.invalidHand
        }
        guard let hand = Hand(rawValue: possibleHand) else {
            throw GameError.invalidHand
        }
        
        return hand
    }
    
    private func castedHand(from possibleHand: Int) throws -> Hand {
        guard let hand = Hand(rawValue: possibleHand) else {
            throw GameError.invalidHand
        }
        
        return hand
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
        computerAnswer = try! castedHand(from: generatedRandomAnswer())
        
        while true {
            print(gameMessage: .menu)
            let userInput: String? = readLine()
            
            if userInput == "0" {
                finishGame(withMessage: .finish)
            }
            do {
                userAnswer = try castedHand(from: userInput)
            } catch GameError.invalidHand {
                print(gameMessage: .invalidHandError)
                continue
            } catch {
                Swift.print("그 외 오류 발생 : ", error)
                continue
            }
            
            gameResultHandling(getGameResult())
        }
    }
}

MukChiBaGame().startGame()
