//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum RockPaperScissorsCase: Int {
    case exit = 0
    case rock = 1
    case paper = 2
    case scissors = 3
}

class RockPaperScissors {
    var computerCase = 0
    var userCase = 0
    
    func createRandomComputerCase() -> Int {
        let randomCase = Int.random(in: 1...3)
        print("개발용 컴퓨터 확인 \(randomCase)")
        return randomCase
    }
    
    func userInputCase(mode: String) -> Int {
        while true {
            guard let userInputText = readLine() else {
                continue
            }
            guard let userInputNumber = Int(userInputText) else {
                continue
            }
            
            let userCase = RockPaperScissorsCase(rawValue: userInputNumber)
            
            switch userCase {
            case .exit:
                print("게임 종료")
                return 0
            case .rock:
                return 1
            case .paper:
                return 2
            case .scissors:
                return 3
            default:
                if mode == "가위바위보" {
                    print("잘못된 입력입니다. 다시 입력해주세요.")
                } else {
                    print("잘못된 입력입니다. 다시 시도해주세요.")
                    return 4
                }
                
            }
        }
    }
    
    func checkWinLoseResult(user: Int, computer: Int) -> Int {
        let whoWinCheck: Int = user - computer
        var gameResult: Int = 0
        
        // 가위바위보
        if user == 0 {
            gameResult = 0
        } else if user == 4 {
            gameResult = 1
        } else if whoWinCheck == 1 || whoWinCheck == -2 {
            gameResult = 1
        } else if whoWinCheck == -1 || whoWinCheck == 2 {
            gameResult = 2
        } else if whoWinCheck == 0 {
            gameResult = 3
        }
        
        return gameResult
    }
    
    func printResultChangeGameState(gameResult: Int) -> Int {
        switch gameResult {
        case 0:
            return 0
        case 1:
            print("이겼습니다!")
            return 1
        case 2:
            print("졌습니다!")
            return 2
        default:
            print("비겼습니다!")
            return 3
        }
    }
    
    func playGame() {
        var playGameSwitch: Int = 1
        var winLoseResult: Int = 0
        var gameMode: String = "가위바위보"
        
        while playGameSwitch != 0 {
            print("가위(1). 바위(2). 보(3)! <종료 : 0> : ", terminator: "")
            
            computerCase = createRandomComputerCase()
            userCase = userInputCase(mode: gameMode)
            
            winLoseResult = checkWinLoseResult(user: userCase, computer: computerCase)
            
            playGameSwitch = printResultChangeGameState(gameResult: winLoseResult)
            
            while playGameSwitch != 0 && playGameSwitch != 3 {
                gameMode = "묵찌빠"
                
                let nowPlayTurn = whoNowTurn(gameResult: playGameSwitch)
                print("[\(nowPlayTurn) 턴] 묵(1). 찌(2). 빠(3)! <종료: 0> : ", terminator: "")
                
                computerCase = createRandomComputerCase()
                userCase = userInputCase(mode: gameMode)
                
                winLoseResult = checkWinLoseResult(user: userCase, computer: computerCase)
                playGameSwitch = printMukjjibbaResult(
                    gameResult: winLoseResult, nowTurn: nowPlayTurn)
            }
        }
    }

    func whoNowTurn(gameResult: Int)  -> String {
        var nowTurn:String
        
        if gameResult == 1 {
            nowTurn = "유저"
        } else {
            nowTurn = "컴퓨터"
        }
        
        return nowTurn
    }
    
    func printMukjjibbaResult(gameResult: Int, nowTurn: String) -> Int {
        switch gameResult {
        case 2:
            print("사용자 턴입니다.")
            return 1
        case 1:
            print("컴퓨터 턴입니다.")
            return 2
        default:
            print("\(nowTurn)의 승리!")
            return 0
        }
    }
    
}

var testGame = RockPaperScissors()
testGame.playGame()
