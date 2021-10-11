//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct RockPaperScissorsGame {
    
    func validate(playerNumber: String) -> Bool {
        let validInputs = ["0", "1", "2", "3"]
        return validInputs.contains(playerNumber)
    }
    
    func main() {
        var playerNumber: String? = nil
        var computerNumber = ""
        repeat {
            computerNumber = String(Int.random(in: 1...3))
            print(computerNumber)
            playerNumber = getUserInput()
        } while isDraw(computerNumber, playerNumber) || isWrong(playerNumber: playerNumber)
        // 승패판정해서 출력
        if isVictory(computerNumber, playerNumber) {
            print("이겼습니다!")
        } else {
            print("졌습니다!")
        }
        print("게임종료")
    }
    
    func isVictory(_ computerNumber: String, _ playerNumber: String?) -> Bool {
        let winningCaseA = playerNumber == "1" && computerNumber == "3"
        let winningCaseB = playerNumber == "2" && computerNumber == "1"
        let winningCaseC = playerNumber == "3" && computerNumber == "2"
        
        return winningCaseA || winningCaseB || winningCaseC
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
    
    private func getUserInput() -> String? {
        print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
        if let userInput = readLine(), validate(playerNumber: userInput) {
            return userInput
        }
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return nil
    }
}

let rockPaperScissors = RockPaperScissorsGame()

rockPaperScissors.main()
