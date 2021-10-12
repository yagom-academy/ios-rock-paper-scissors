//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct RockPaperScissorsGame {
    let quit = "0"
    let scissor = "1"
    let rock = "2"
    let paper = "3"
    
    func startGame() {
        var playerNumber: String? = nil
        var computerNumber = ""
        repeat {
            computerNumber = String(Int.random(in: 1...3))
            print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
            playerNumber = getUserInput()
        } while isDraw(computerNumber, playerNumber) || isWrong(playerNumber: playerNumber)
        
        guard playerNumber != quit else {
            print("게임 종료")
            return
        }
        if isPlayerWin(playerNumber, computerNumber) {
            print("이겼습니다!")
        } else {
            print("졌습니다!")
        }
        print("게임종료")
    }
    
    private func getUserInput(_ input: String? = readLine()) -> String? {
        if let userInput = input, validate(playerNumber: userInput) {
            return userInput
        }
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return nil
    }
    
    private func validate(playerNumber: String) -> Bool {
        let validInputs = [quit, scissor, rock, paper]
        return validInputs.contains(playerNumber)
    }
    
    private func isDraw(_ computerNumber: String, _ playerNumber: String?) -> Bool {
        if computerNumber == playerNumber {
            print("비겼습니다!")
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
