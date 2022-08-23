//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 정정수 on 2022/08/22.
//

import Foundation

struct RockPaperScissorsGame {
    func showMenu() {
        print("가위(\(RPS.scissors.rawValue)),",
              "바위(\(RPS.rock.rawValue)),",
              "보(\(RPS.paper.rawValue))! <종료 : 0>: ", terminator: "")
    }
    
    func inputUserNumber() -> Int? {
        guard let inputUserNumber = readLine(), inputUserNumber.isEmpty == false else {
            print("입력된 값이 없습니다.")
            return inputUserNumber()
        }
        let inputUserNumberToInt = Int(inputUserNumber)
        return inputUserNumberToInt
        
    }
    
    func generateUserRPS() -> RPS? {
        showMenu()
        
        guard let userNumber = inputUserNumber() else {
            return generateUserRPS()
        }
        
        guard userNumber != 0 else {
            return nil
        }
        
        guard let userRPS: RPS = .init(rawValue: userNumber) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return generateUserRPS()
        }
        return userRPS
    }
    
    func generateComputerRandomRPS() -> RPS {
        let computerNumber = Int.random(in: 1...3)
        
        guard let computerRPS: RPS = .init(rawValue: computerNumber) else {
            return generateComputerRandomRPS()
        }
        return computerRPS
    }
    
    func judgeWinOrLose(_ userRPS: RPS, _ computerRPS: RPS) -> GameResult {
        var gameResult: GameResult = .draw
        
        if userRPS == computerRPS {
            return gameResult
        }
        
        switch userRPS {
        case .scissors:
            if computerRPS == .paper {
                gameResult = .win
            } else if computerRPS == .rock {
                gameResult = .lose
            }
        case .rock:
            if computerRPS == .scissors {
                gameResult = .win
            } else if computerRPS == .paper {
                gameResult = .lose
            }
        case .paper:
            if computerRPS == .rock {
                gameResult = .win
            } else if computerRPS == .scissors {
                gameResult = .lose
            }
        }
        return gameResult
    }
    
    func showResult(_ result: GameResult) {
        switch result {
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("비겼습니다!")
        }
    }
}


