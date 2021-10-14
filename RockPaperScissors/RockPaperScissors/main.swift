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

enum PlayerOption: CaseIterable {
    case quit
    case scissor
    case rock
    case paper
    
    static var randomHand: PlayerOption {
        return PlayerOption.allCases[Int.random(in: 1...3)]
    }
}

struct GameJudgment {
    func isRestartable(_ playerHand: PlayerOption?, _ opponentHand: PlayerOption) -> Bool {
        if playerHand == opponentHand {
            print(Message.gameDraw)
            return true
        }
        return false
    }
    
    func isPlayerWin(_ playerHand: PlayerOption?, _ opponentHand: PlayerOption) -> Bool {
        switch (playerHand, opponentHand) {
        case (.scissor, .paper), (.rock, .scissor), (.paper, .rock):
            return true
        default:
            return false
        }
    }
    
    func printGameResult(from playerHand: PlayerOption?, and opponentHand: PlayerOption) -> Bool {
        if isPlayerWin(playerHand, opponentHand) {
            print(Message.gameWin)
            return true
        } else {
            print(Message.gameLose)
            return false
        }
    }
}

struct ScissorsRockPaperGame {
    private let gameJudgment = GameJudgment()
    
    func isPlayersTurn() -> Bool? {
        var playerHand: PlayerOption?
        var computerHand: PlayerOption
        
        repeat {
            computerHand = PlayerOption.randomHand
            print(Message.start, terminator: "")
            playerHand = recieveUserInput()
        } while gameJudgment.isRestartable(playerHand, computerHand) || isWrongInput(playerHand: playerHand)
        
        guard playerHand != .quit else {
            print(Message.gameEnd)
            return nil
        }
        return gameJudgment.printGameResult(from: playerHand, and: computerHand)
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
    
    private func isWrongInput(playerHand: PlayerOption?) -> Bool { playerHand == nil }
}

struct RockScissorsPaper {
    let gameJudgment = GameJudgment()
    var userTurn: Bool? = ScissorsRockPaperGame().isPlayersTurn()
    var firstTurn: String {
        if userTurn == true {
            return "사용자"
        } else if userTurn == false {
            return "컴퓨터"
        } else {
            return ""
        }
    }

    mutating func startGame() {
        guard userTurn != nil else {
            return
        }
        print("[\(firstTurn)의 턴] \(Message.startRockScissorsPaper)", terminator: "")
        let computerHand: PlayerOption = PlayerOption.randomHand
        guard let playerHand = recieveUserInput() else {
            startGame()
            return
        }
        guard playerHand != .quit else {
            print(Message.gameEnd)
            return
        }
        guard gameJudgment.isRestartable(playerHand, computerHand) else {
            userTurn = gameJudgment.isPlayerWin(playerHand, computerHand)
            print("\(firstTurn)의 턴입니다.")
            startGame()
            return
        }
        printGameResult(when: userTurn)
    }
    
    private func printGameResult(when userTurn: Bool?) {
        if userTurn == true {
            print("사용자의 승리!")
        } else {
            print("컴퓨터의 승리!")
        }
    }
    private func isWrongInput(playerHand: PlayerOption?) -> Bool { playerHand == nil }
    
    func recieveUserInput(_ userInput: String? = readLine()) -> PlayerOption? {
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
}
var rockPaperScissors = RockScissorsPaper()
rockPaperScissors.startGame()
