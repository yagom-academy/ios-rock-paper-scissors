//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum RockPaperScissorsHand: String {
    case exit = "0"
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

enum MukjjibbaHand: String {
    case exit = "0"
    case muk = "1"
    case jji = "2"
    case bba = "3"
}

enum RockPaperScissorsGameResult: Int {
    case exit = 0
    case win = 1
    case lose = 2
    case draw = 3
}

enum MukjjibbaGameResult: Int {
    case exit = 0
    case computerturn = 1
    case userturn = 2
    case win = 3
}

class RockPaperScissors {
    var computerHand = 0
    var userHand = 0
    
    func playGame() {
        var playGameSwitch: Int = 1
        var rockPaperScissorswinLoseResult: RockPaperScissorsGameResult = .draw
        
        while playGameSwitch != 0 {
            print("가위(1). 바위(2). 보(3)! <종료 : 0> : ", terminator: "")
            
            computerHand = choiceRandomComputerHand()
            userHand = choiceUserRockPaperScissorsHand()
            
            rockPaperScissorswinLoseResult = checkWinLoseRockPaperScissorsResult(
                user: userHand, computer: computerHand)
            
            playGameSwitch = printRockPaperScissorsResult(gameResult: rockPaperScissorswinLoseResult)
            
            while playGameSwitch != 0 && playGameSwitch != 3 {
                var mukjjibbaWinLoseResult: MukjjibbaGameResult = .userturn
                let nowPlayTurn = whoNowTurn(gameResult: playGameSwitch)
                print("[\(nowPlayTurn) 턴] 묵(1). 찌(2). 빠(3)! <종료: 0> : ", terminator: "")
                
                computerHand = choiceRandomComputerHand()
                userHand = choiceUserMukjjibbaHand()
                
                mukjjibbaWinLoseResult = checkWinLoseMukjjibbaResult(
                    user: userHand, computer: computerHand)
                playGameSwitch = printMukjjibbaResult(
                    gameResult: mukjjibbaWinLoseResult, nowTurn: nowPlayTurn)
            }
        }
    }
    
    func choiceRandomComputerHand() -> Int {
        let randomHand: Int = Int.random(in: 1...3)
        print("com : \(randomHand)")
        return randomHand
    }
    
    func choiceUserRockPaperScissorsHand() -> Int {
        while true {
            guard let userInputText = readLine() else {
                continue
            }
            
            let userHand = RockPaperScissorsHand(rawValue: userInputText)
            
            switch userHand {
            case .exit:
                print("게임 종료")
                return 0
            case .scissors:
                return 1
            case .rock:
                return 2
            case .paper:
                return 3
            default:
                print("잘못된 입력입니다. 다시 입력해주세요.")

            }
        }
    }
    
    func choiceUserMukjjibbaHand() -> Int {
        while true {
            guard let userInputText = readLine() else {
                continue
            }
            
            let userHand = MukjjibbaHand(rawValue: userInputText)
            switch userHand {
            case .exit:
                print("게임 종료")
                return 0
            case .muk:
                return 1
            case .jji:
                return 2
            case .bba:
                return 3
            default:
                print("잘못된 입력입니다. 다시 시도해주세요.")
                return 4
            }
        }
    }
    
    func checkWinLoseRockPaperScissorsResult(user: Int, computer: Int) -> RockPaperScissorsGameResult {
        let whoWinCheck: Int = (user - computer + 3) % 3
        var gameResult = RockPaperScissorsGameResult.draw
        
        // 가위(1) 바위(2) 보(3)
        // 1, 3 -> (-2 + 3) % 3 = 1
        if user == 0 {
            gameResult = .exit
        } else if whoWinCheck == 1 {
            gameResult = .win
        } else if whoWinCheck == 2 {
            gameResult = .lose
        } else if whoWinCheck == 0 {
            gameResult = .draw
        }
        
        return gameResult
    }
    
    func checkWinLoseMukjjibbaResult(user: Int, computer: Int) -> MukjjibbaGameResult {
        let whoWinCheck: Int = (user - computer + 3) % 3
        var gameResult: MukjjibbaGameResult = .exit
        
        // 묵(1) 찌(2) 빠(3)
        // 1, 3 -> (-2 + 3) % 3 = 1
        if user == 0 {
            gameResult = .exit
        } else if user == 4 {
            gameResult = .computerturn
        } else if whoWinCheck == 1 {
            gameResult = .computerturn
        } else if whoWinCheck == 2 {
            gameResult = .userturn
        } else if whoWinCheck == 0 {
            gameResult = .win
        }
        
        return gameResult
    }

    func printRockPaperScissorsResult(gameResult: RockPaperScissorsGameResult) -> Int {
        switch gameResult {
        case .exit:
            return 0
        case .win:
            print("이겼습니다!")
            return 1
        case .lose:
            print("졌습니다!")
            return 2
        default:
            print("비겼습니다!")
            return 3
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
    
    func printMukjjibbaResult(gameResult: MukjjibbaGameResult, nowTurn: String) -> Int {
        switch gameResult {
        case .userturn:
            print("사용자 턴입니다.")
            return 1
        case .computerturn:
            print("컴퓨터 턴입니다.")
            return 2
        case .exit:
            return 0
        default:
            print("\(nowTurn)의 승리!")
            return 0
        }
    }
}

var testGame = RockPaperScissors()
testGame.playGame()
