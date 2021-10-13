//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Message: String, CustomStringConvertible {
    var description: String {
        return rawValue
    }
    case start = "가위(1), 바위(2), 보(3)! <종료: 0> : "
    case gameWin = "이겼습니다!"
    case gameLose = "졌습니다!"
    case gameDraw = "비겼습니다!"
    case gameEnd = "게임 종료"
    case wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
}

enum RockPaperScissor: CaseIterable {
    case quit
    case scissor
    case rock
    case paper
}

struct RockPaperScissorsGame {
    private var randomHand: RockPaperScissor {
        return RockPaperScissor.allCases[Int.random(in: 1...3)]
    }
    
    func startGame() {
        var playerHand: RockPaperScissor?
        var computerHand: RockPaperScissor
        repeat {
            computerHand = self.randomHand
            print(Message.start, terminator: "")
            playerHand = recieveUserInput()
        } while isDraw(playerHand, computerHand) || isWrongInput(playerHand: playerHand)
        
        guard playerHand != .quit else {
            print(Message.gameEnd)
            return
        }
        if isPlayerWin(playerHand, computerHand) {
            print(Message.gameWin)
        } else {
            print(Message.gameLose)
        }
        print(Message.gameEnd)
    }
    
    private func recieveUserInput(_ userInput: String? = readLine()) -> RockPaperScissor? {
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
    
    private func isWrongInput(playerHand: RockPaperScissor?) -> Bool { playerHand == nil }
    
    private func isDraw(_ playerHand: RockPaperScissor?, _ opponentHand: RockPaperScissor) -> Bool {
        if opponentHand == playerHand {
            print(Message.gameDraw)
            return true
        }
        return false
    }
    
    private func isPlayerWin(_ playerHand: RockPaperScissor?, _ opponentHand: RockPaperScissor) -> Bool {
        switch (playerHand, opponentHand) {
        case (.scissor, .paper), (.rock, .scissor), (.paper, .rock):
            return true
        default:
            return false
        }
    }
}

let rockPaperScissors = RockPaperScissorsGame()

rockPaperScissors.startGame()
