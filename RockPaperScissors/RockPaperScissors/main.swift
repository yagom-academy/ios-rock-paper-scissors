//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

enum RockPaperScissors: Int, CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum GameResult {
    case win
    case lose
    case draw
}

struct RockPaperScissorsGame {
    
    func start() {
        var gameFlag = true
        
        while gameFlag {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
            
            guard let computerSign = makeComputerSign() else {
                continue
            }
            
            guard let userSign = inputUserSign(gameFlag: &gameFlag) else {
                continue
            }
            
            let gameResult = decideResult(computerSign: computerSign, userSign: userSign)
            gameFlag = printGameResult(gameResult: gameResult)
        }
        
        print("게임 종료")
    }
    
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
    
    func decideResult(computerSign: RockPaperScissors, userSign: RockPaperScissors) -> GameResult{
        
        if userSign == computerSign {
            return .draw
        }
        
        if userSign == .scissors {
            return computerSign == .paper ? .win : .lose
        }
        
        if userSign == .paper {
            return computerSign == .rock ? .win : .lose
        }
        
        if userSign == .rock {
            return computerSign == .scissors ? .win : .lose
        }
        
        return .draw
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

let newGame = RockPaperScissorsGame()
newGame.start()
