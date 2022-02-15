//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

enum RockPaperScissors: Int, CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
    
    func playGame(with opponentPlayer: RockPaperScissors) -> GameResult {
        
        if self == opponentPlayer {
            return .draw
        }
        
        if self == .scissors {
            return opponentPlayer == .paper ? .win : .lose
        }
        
        if self == .paper {
            return opponentPlayer == .rock ? .win : .lose
        }
        
        if self == .rock {
            return opponentPlayer == .scissors ? .win : .lose
        }
        
        return .draw
    }
}

enum GameResult {
    case win
    case lose
    case draw
}

class RockPaperScissorsGame {
    
    func makeComputerSign() -> RockPaperScissors? {
        guard let randomSign = RockPaperScissors.allCases.randomElement() else {
            return nil
        }
        
        return randomSign
    }
    
    func inputUserSign(gameFlag: inout Bool) -> RockPaperScissors? {
        guard let inputNumber = readLine() else {
            return nil
        }
        
        guard let convertedIntNumber = Int(inputNumber) else {
            return nil
        }
        
        guard convertedIntNumber != Int.zero else {
            gameFlag = false
            return nil
        }
        
        guard let rockPaperScissorsSign = RockPaperScissors(rawValue: convertedIntNumber) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return nil
        }
        
        return rockPaperScissorsSign
    }
    
    func startGame() {
        var gameFlag = true
        
        while gameFlag {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
            
            guard let computerSign = makeComputerSign() else {
                continue
            }
            
            guard let userSign = inputUserSign(gameFlag: &gameFlag) else {
                continue
            }
            
            let gameResult = userSign.playGame(with: computerSign)
            gameFlag = printGameResult(gameResult: gameResult)
        }
        
        print("게임 종료")
    }
    
    func printGameResult(gameResult: GameResult) -> Bool {
        switch gameResult {
        case .win:
            print("이겼습니다!")
            return false
        case .lose:
            print("졌습니다!")
            return false
        case .draw:
            print("비겼습니다")
            return true
        }
    }
}

let c = RockPaperScissorsGame()
c.startGame()
