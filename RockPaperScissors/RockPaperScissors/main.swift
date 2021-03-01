//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class RockPaperScissors {
    var computerCase = 0
    var userCase = 0
    
    func randomCaseGenerator() {
        let randomCase = Int.random(in: 1...3)
        computerCase = randomCase
    }
    
    func userInputCase() -> Int {
        while true {
            guard let userInputText = readLine() else {
                continue
            }
            guard let userInputNumber = Int(userInputText) else {
                continue
            }
            
            switch userInputNumber {
            case 0:
                print("게임 종료")
                return 0
            case 1:
                return 1
            case 2:
                return 2
            case 3:
                return 3
            default:
                print("잘못된 입력입니다. 다시 입력해주세요.")
            }
        }
    }
    
    func checkWinLoseResult(user: Int, computer: Int) -> Int {
            let whoWinCheck: Int = user - computer
            var GameResult: Int = 0
            
            if whoWinCheck == 0 {
                GameResult = 3
            } else if whoWinCheck == 1 || whoWinCheck == -2 {
                GameResult = 1
            } else if whoWinCheck == -1 || whoWinCheck == 2 {
                GameResult = 2
            }
            
            return GameResult
        }
    
    func playGame() {
        var gameState: Bool = true
        var winLoseResult: Int = 0
        
        while gameState {
            print("가위(1). 바위(2). 보(3)! <종료 : 0> : ", terminator: "")
            
            randomCaseGenerator()
            userCase = userInputCase()
            
            winLoseResult = checkWinLoseResult(
                user: userCase,
                computer: computerCase)
            
            if winLoseResult == 1 {
                print("이겼습니다!")
                gameState = false
            } else if winLoseResult == 2 {
                print("졌습니다!")
                gameState = false
            } else if winLoseResult == 0 {
                gameState = false
            } else {
                print("비겼습니다!")
                continue
            }
        }
    }
    
}

var testGame = RockPaperScissors()

testGame.playGame()


