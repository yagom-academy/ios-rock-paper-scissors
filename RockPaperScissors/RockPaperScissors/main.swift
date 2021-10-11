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
            playerNumber = getUserInput()
        } while isDraw(computerNumber, playerNumber) || isWrong(playerNumber: playerNumber)
    }
    
    private func isDraw(_ computerNumber: String, _ playerNumber: String?) -> Bool {
        return computerNumber == playerNumber
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
