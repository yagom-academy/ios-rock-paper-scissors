//
//  ScissorsRockPaper.swift
//  RockPaperScissors
//
//  Created by Kyungmin Lee on 2020/11/08.
//

import Foundation



/// 가위 바위 보 클래스
class ScissorsRockPaper {
    var gameStatus: ScissorsRockPaperStatus = .initializeGame
    var userHand: Hand?
    var computerHand: Hand?
    
    enum ScissorsRockPaperStatus: Int {
        case initializeGame = 0
        case inputUser
        case inputComputer
        case decideResult
        case endGame
        
        func nextStatus() -> ScissorsRockPaperStatus {
            guard let nextStatus = ScissorsRockPaperStatus(rawValue: self.rawValue + 1) else {
                return self
            }
            
            return nextStatus
        }
    }
    
    func progress() {
        switch gameStatus {
        case .initializeGame:
            printGame()
            nextStatus()
            
        case .inputUser:
            inputUser()
            nextStatus()
            
        case .inputComputer:
            inputComputer()
            nextStatus()
            
        case .decideResult:
            break
            
        case .endGame:
            break
        }
        
        
    }
    
    func printGame() {
        switch gameStatus {
        case .initializeGame:
            print("가위(1), 바위(2), 보(3)! <종료 : 0 > :")
        case .endGame:
            print("게임 종료")
        default:
            break
        }
    }
    
    func nextStatus() {
        guard let nextStatus = ScissorsRockPaperStatus(rawValue: gameStatus.rawValue + 1) else {
            return
        }
        
        gameStatus = nextStatus
    }
    
    func inputUser() {
        while true {
            guard let input = readLine(), let inputNumber = Int(input),inputNumber >= 0, inputNumber <= 3 else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            // 0입력시 게임 종료
            guard inputNumber != 0 else {
                gameStatus = .endGame
                return
            }
            
            userHand = Hand.scissorsRockPaper(number: inputNumber)
            return
        }
        
    }
    
    func inputComputer() {
        computerHand = Hand.scissorsRockPaper(number: Int.random(in: 1...3))
    }
    
    func decideResult() {
        guard let userHand = self.userHand, let computerHand = self.computerHand else {
            return
        }
        
        
        
        
    }
}
