//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 정정수 on 2022/08/22.
//

import Foundation

class RockPaperScissorsGame {
    var userNumber: Int = 0
    var computerNumber: Int = 0
    var result: Int = 0

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
            return generateRandomNumber()
        }
        
        guard userNumber != 0 else {
            return nil
        }
        
        guard let userRPS: RPS = .init(rawValue: userNumber) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return generateRandomNumber()
        }
    }
    
    func generateRandomNumber() {
        computerNumber = Int.random(in: 1...3)
    }
    
    func judgeWinOrLose(_ runningTheGame: Bool) {
        if runningTheGame == true {
            switch userNumber - computerNumber {
            case -1, 2:
                result = 1
            case -2, 1:
                result = 2
            case 0:
                result = 0
            default:
                result = -1
            }
        }
    }
    
    func playGame() {
        var flag: Bool = true
        
        while flag {
            showMenu()
            generateRandomNumber()
            judgeWinOrLose(isValidateUserNumber())
        }
    }
}


