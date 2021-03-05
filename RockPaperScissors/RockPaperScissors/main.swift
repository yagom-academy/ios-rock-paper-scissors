//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class HandGame {
    var computerAnswer: Hand?
    var userAnswer: Hand?
    enum GameResult {
        case draw, win, lose
    }
    enum Hand: Int {
        case rock = 1
        case paper = 2
        case scissors = 3
    }
    enum GameMessage {
        static let finish = "게임 종료"
        static let invalidHandError = "잘못된 입력입니다. 다시 시도해주세요."
    }
    enum CastedHandError: Error {
        case invalidHand
    }
    
    func generatedRandomAnswer() -> Int {
        return Int.random(in: 1...3)
    }
    
    func castedHand(from possibleText: String?) throws -> Hand {
        guard let text: String = possibleText else {
            throw CastedHandError.invalidHand
        }
        guard let possibleHand: Int = Int(text) else {
            throw CastedHandError.invalidHand
        }
        guard let hand = Hand(rawValue: possibleHand) else {
            throw CastedHandError.invalidHand
        }
        
        return hand
    }
    
    func castedHand(from possibleHand: Int) throws -> Hand {
        guard let hand = Hand(rawValue: possibleHand) else {
            throw CastedHandError.invalidHand
        }
        
        return hand
    }
    
    func finishGame(withMessage message: String) {
        print(message)
        exit(0)
    }
    
    func getGameResult() -> GameResult {
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
}

class RockPaperScissorsGame: HandGame {
    private enum Hand: Int {
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    private enum GameMessage {
        static let menu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        static let draw = "비겼습니다!"
        static let win = "이겼습니다!"
        static let lose = "졌습니다!"
    }
    
    private func inputUserAnswer() {
        print(GameMessage.menu, terminator: "")
        let userInput: String? = readLine()
        
        if userInput == "0" {
            finishGame(withMessage: HandGame.GameMessage.finish)
        }
        do {
            userAnswer = try castedHand(from: userInput)
        } catch CastedHandError.invalidHand {
            print(HandGame.GameMessage.invalidHandError)
            inputUserAnswer()
        } catch {
            fatalError()
        }
    }
        
    private func gameResultHandling(by gameResult: GameResult) -> GameResult {
        switch gameResult {
        case .draw:
            print(GameMessage.draw)
            return start()
        case .lose:
            print(GameMessage.lose)
            return gameResult
        case .win:
            print(GameMessage.win)
            return gameResult
        }
    }
    
    func start() -> GameResult {
        computerAnswer = try! castedHand(from: generatedRandomAnswer())
        inputUserAnswer()
        return gameResultHandling(by: getGameResult())
    }
}

class MukChiBaGame: HandGame {
    private var isUserTurn: Bool?
    private enum Hand: Int {
        case rock = 1
        case scissors = 2
        case paper = 3
    }
    private enum GameMessage {
        static let userMenu = "[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
        static let computerMenu = "[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
        static let userTurn = "사용자의 턴입니다"
        static let computerTurn = "컴퓨터의 턴입니다"
        static let userWin = "사용자의 승리!"
        static let computerWin = "컴퓨터의 승리!"
    }
    
    private func inputUserAnswer() {
        let userInput: String?
        
        if isUserTurn == true {
            print(GameMessage.userMenu, terminator: "")
            userInput = readLine()
        } else {
            print(GameMessage.computerMenu, terminator: "")
            userInput = readLine()
        }
        if userInput == "0" {
            finishGame(withMessage: HandGame.GameMessage.finish)
        }
        do {
            userAnswer = try castedHand(from: userInput)
        } catch CastedHandError.invalidHand {
            print(HandGame.GameMessage.invalidHandError)
            inputUserAnswer()
        } catch {
            fatalError()
        }
    }
    
    private func gameResultHandling(by gameResult: GameResult) {
        switch gameResult {
        case .draw:
            if isUserTurn == true {
                finishGame(withMessage: GameMessage.userWin)
            } else {
                finishGame(withMessage: GameMessage.computerWin)
            }
        case .lose:
            isUserTurn?.toggle()
            if isUserTurn == true {
                print(GameMessage.userTurn)
            } else {
                print(GameMessage.computerTurn)
            }
            start()
        case .win:
            if isUserTurn == true {
                print(GameMessage.userTurn)
            } else {
                print(GameMessage.computerTurn)
            }
            start()
        }
    }
    
    func start() {
        if isUserTurn == nil {
            let gameResult = RockPaperScissorsGame().start()
            switch gameResult {
            case .win:
                isUserTurn = true
            case .lose:
                isUserTurn = false
            default:
                fatalError()
            }
        }
        computerAnswer = try! castedHand(from: generatedRandomAnswer())
        inputUserAnswer()
        gameResultHandling(by: getGameResult())
    }
}

var game = MukChiBaGame()
game.start()
