//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class RockPaperScissors {
    var comNumberValue = 0
    var userNumberValue = 0
    
    func comNumberGenerator() {
        let numberGeneration = Int.random(in: 1...3)
        comNumberValue = numberGeneration
    }
    
    func userInputNumber() -> Int {
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
                print("가위")
                return 1
            case 2:
                print("바위")
                return 2
            case 3:
                print("보")
                return 3
            default:
                print("잘못된 입력입니다. 다시 입력해주세요.")
            }
        }
    }
    
    func checkWinLoseResult(user: Int, computer: Int) -> Int {
            let whoWinResult: Int = user - computer
            var returnGameResult: Int = 0
            
            if whoWinResult == 0 {
                returnGameResult = 3
            } else if whoWinResult == 1 || whoWinResult == -2 {
                returnGameResult = 1
            } else if whoWinResult == -1 || whoWinResult == 2 {
                returnGameResult = 2
            }
            
            return returnGameResult
        }
    
    func playGame() {
        var gameState: Bool = true
        var winLoseResult: Int = 0
        
        
        while gameState {
            print("가위(1). 바위(2). 보(3)! <종료 : 0> : ", terminator: "")
            
            comNumberGenerator()
            
            userNumberValue = userInputNumber()
            
            winLoseResult = checkWinLoseResult(
                user: userNumberValue,
                computer: comNumberValue)
            
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


