//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Message: String, CustomStringConvertible {
    case start = "가위(1), 바위(2), 보(3)! <종료: 0> : "
    case gameWin = "이겼습니다!"
    case gameLose = "졌습니다!"
    case gameDraw = "비겼습니다!"
    case gameEnd = "게임 종료"
    case wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
    case startRockScissorsPaper = "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
    
    var description: String {
        return rawValue
    }
}

enum GameMode {
    case scissorsRockPaper
    case rockScissorsPaper
}

enum PlayerOption: CaseIterable {
    case quit
    case scissor
    case rock
    case paper
    
    static var randomHand: PlayerOption {
        let handCount = PlayerOption.allCases.count
        return PlayerOption.allCases[Int.random(in: 1...handCount)]
    }
}

struct GameManager {
    func isRestartable(mode: GameMode, _ playerHand: PlayerOption?, _ opponentHand: PlayerOption) -> Bool {
        let isHandSame = playerHand == opponentHand
        switch (mode, isHandSame) {
        case (.scissorsRockPaper, true):
            print(Message.gameDraw)
            return true
        case (.rockScissorsPaper, false):
            return true
        default:
            return false
        }
    }
    
    func isPlayerWin(_ playerHand: PlayerOption?, _ opponentHand: PlayerOption) -> Bool {
        switch (playerHand, opponentHand) {
        case (.scissor, .paper), (.rock, .scissor), (.paper, .rock):
            return true
        default:
            return false
        }
    }
    
    func printGameResult(from playerHand: PlayerOption?, and opponentHand: PlayerOption) {
        if isPlayerWin(playerHand, opponentHand) {
            print(Message.gameWin)
        } else {
            print(Message.gameLose)
        }
    }
    
    func isWrongInput(playerHand: PlayerOption?) -> Bool { playerHand == nil }
}

struct ScissorsRockPaperGame {
    private let gameManager = GameManager()
    
    func isPlayersTurn() -> Bool? {
        var playerHand: PlayerOption?
        var computerHand: PlayerOption
        
        repeat {
            computerHand = PlayerOption.randomHand
            print(Message.start, terminator: "")
            playerHand = recieveUserInput()
        } while gameManager.isRestartable(mode: .scissorsRockPaper,playerHand, computerHand) || gameManager.isWrongInput(playerHand: playerHand)
        
        guard playerHand != .quit else {
            print(Message.gameEnd)
            return nil
        }
        gameManager.printGameResult(from: playerHand, and: computerHand)
        return gameManager.isPlayerWin(playerHand, computerHand)
    }
    
    private func recieveUserInput(_ userInput: String? = readLine()) -> PlayerOption? {
        switch userInput {
        case "0":
            return .quit
        case "1":
            return .scissor
        case "2":
            return .rock
        case "3":
            return .paper
        default:
            print(Message.wrongInput)
            return nil
        }
    }
}

struct RockScissorsPaperGame {
    private let gameManager = GameManager()
    private var isPlayerTurn: Bool? = ScissorsRockPaperGame().isPlayersTurn()
    private var currentTurnHolder: String {
        if isPlayerTurn == true {
            return "사용자"
        }
        return "컴퓨터"
    }
    
    mutating func startGame() {
        guard isPlayerTurn != nil else {
            return
        }
        
        var playerHand: PlayerOption?
        var computerHand: PlayerOption
        var isContinued = false
        
        repeat {
            computerHand = PlayerOption.randomHand
            changeTurn(when: isContinued, playerHand, computerHand)
            print("[\(currentTurnHolder)의 턴] \(Message.startRockScissorsPaper)", terminator: "")
            playerHand = recieveUserInput()
            if playerHand == .quit { break }
            isContinued = true
        } while gameManager.isRestartable(mode: .rockScissorsPaper, playerHand, computerHand) || gameManager.isWrongInput(playerHand: playerHand)
        
        guard playerHand != .quit else {
            print(Message.gameEnd)
            return
        }
        
        printGameResult(when: isPlayerTurn)
    }
    
    mutating private func changeTurn(when isContinued: Bool, _ playerHand: PlayerOption?, _ computerHand: PlayerOption) {
        guard isContinued else { return }
        if playerHand == nil {
            isPlayerTurn = false
        } else if isContinued {
            isPlayerTurn = gameManager.isPlayerWin(playerHand, computerHand)
            print("\(currentTurnHolder)의 턴입니다.")
        }
    }

    private func recieveUserInput(_ userInput: String? = readLine()) -> PlayerOption? {
        switch userInput {
        case "0":
            return .quit
        case "1":
            return .rock
        case "2":
            return .scissor
        case "3":
            return .paper
        default:
            print(Message.wrongInput)
            return nil
        }
    }
    
    private func printGameResult(when userTurn: Bool?) {
        if userTurn == true {
            print("사용자의 승리!")
        } else {
            print("컴퓨터의 승리!")
        }
    }
}

var rockPaperScissors = RockScissorsPaperGame()
rockPaperScissors.startGame()
