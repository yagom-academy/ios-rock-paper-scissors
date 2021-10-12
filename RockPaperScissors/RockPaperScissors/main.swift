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

struct RockPaperScissorsGame {
    private let quit = "0"
    private let scissor = "1"
    private let rock = "2"
    private let paper = "3"
    
    private var randomNumber: String {
        get {
            return String(Int.random(in: 1...3))
        }
    }
    
    func startGame() {
        var playerNumber: String? = nil
        var computerNumber = ""
        repeat {
            computerNumber = self.randomNumber
            print(Message.start, terminator: "")
            playerNumber = getUserInput()
        } while isDraw(computerNumber, playerNumber) || isWrong(playerNumber: playerNumber)
        
        guard playerNumber != quit else {
            print(Message.gameEnd)
            return
        }
        if isPlayerWin(playerNumber, computerNumber) {
            print(Message.gameWin)
        } else {
            print(Message.gameLose)
        }
        print(Message.gameEnd)
    }
    
    private func getUserInput(_ input: String? = readLine()) -> String? {
        if let userInput = input, validate(playerNumber: userInput) {
            return userInput
        }
        print(Message.wrongInput)
        return nil
    }
    
    private func validate(playerNumber: String) -> Bool {
        let validInputs = [quit, scissor, rock, paper]
        return validInputs.contains(playerNumber)
    }
    
    private func isDraw(_ computerNumber: String, _ playerNumber: String?) -> Bool {
        if computerNumber == playerNumber {
            print(Message.gameDraw)
            return true
        }
        return false
    }
    
    private func isWrong(playerNumber: String?) -> Bool {
        return playerNumber == nil
    }
    
    private func isPlayerWin(_ playerNumber: String?, _ opponentNumber: String) -> Bool {
        return (playerNumber == scissor && opponentNumber == paper)
            || (playerNumber == rock && opponentNumber == scissor)
            || (playerNumber == paper && opponentNumber == rock)
    }
}

let rockPaperScissors = RockPaperScissorsGame()

rockPaperScissors.startGame()
