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
    func isDraw(_ playerHand: PlayerOption?, _ opponentHand: PlayerOption) -> Bool {
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
        } while gameJudgment.isDraw(playerHand, computerHand) || isWrongInput(playerHand: playerHand)
        
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
}
