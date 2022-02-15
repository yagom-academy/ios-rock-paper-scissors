//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors: Int, CaseIterable {
    case scissor = 1
    case rock = 2
    case paper = 3
    
    func playGame(with opponentPlayer: RockPaperScissors) -> Result {
        
        if self == opponentPlayer {
            return .draw
        }
        
        if self == .scissor {
            return opponentPlayer == .paper ? .win : .lose
        }
        
        if self == .paper {
            return opponentPlayer == .rock ? .win : .lose
        }
        
        if self == .rock {
            return opponentPlayer == .scissor ? .win : .lose
        }
        
        return .draw
    }
}

enum Result {
    case win
    case lose
    case draw
//    case unknown
}

enum ErrorCase: Error {
    case inputError
}

class RockPaperScissorsGame {
    
    func generateComputerNumber() -> RockPaperScissors? {
        guard let randomData = RockPaperScissors.allCases.randomElement() else {
            return nil
        }
        
        return randomData
    }
    
    func inputUserNumber(flag: inout Bool) -> RockPaperScissors? {
        guard let inputNumber = readLine() else {
            return nil
        }
        
        guard let convertedInt = Int(inputNumber) else {
            return nil
        }
        
        guard convertedInt != Int.zero else {
            flag = false
            return nil
        }
        
        guard let RockPaperScissorsData = RockPaperScissors(rawValue: convertedInt) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return nil
        }
        
        return RockPaperScissorsData
    }
    
    func startGame() {
        var flag = true
        
        while flag {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
            
            guard let computerNumber = generateComputerNumber() else {
                continue
            }
            
            guard let userNumber = inputUserNumber(flag: &flag) else {
                continue
            }
            
//            let checkResult = checkNumber(computer: computerNumber, user: userNumber)
            let checkResult = userNumber.playGame(with: computerNumber)
            flag = printResult(checkResult: checkResult)
        }
        print("게임 종료")
    }
    
    func printResult(checkResult: Result) -> Bool {
        switch checkResult {
        case .win:
            print("이겼습니다!")
            return false
        case .lose:
            print("졌습니다!")
            return false
        case .draw:
            print("비겼습니다")
            return true
//        case .unknown:
//            print("모릅니다")
//            return true
        }
    }
    
//    func checkNumber(computer: RockPaperScissors, user: RockPaperScissors) -> Result {
//
//        if computer == user {
//            return Result.draw
//        }
//
//        if computer == .scissor && user == .paper {
//            return Result.lose
//        }
//
//        if computer == .scissor && user == .rock {
//            return Result.win
//        }
//
//        if computer == .rock && user == .paper {
//            return Result.win
//        }
//
//        if computer == .rock && user == .scissor {
//            return Result.lose
//        }
//
//        if computer == .paper && user == .scissor {
//            return Result.win
//        }
//
//        if computer == .paper && user == .rock {
//            return Result.lose
//        }
//
//        return Result.unknown
//    }
}

let c = RockPaperScissorsGame()
c.startGame()
