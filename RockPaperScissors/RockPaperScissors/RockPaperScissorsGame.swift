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

    func showMenu(_ computerNumber: Int) {
        print("가위(\(RPS.scissors.rawValue)),",
              "바위(\(RPS.rock.rawValue)),",
              "보(\(RPS.paper.rawValue))! <종료 : 0>: ", terminator: "")
    }
    
    func inputUserNumber() -> String {
        guard let inputUserNumber = readLine(), inputUserNumber.isEmpty == false else {
            return "입력된 값이 없습니다."
        }
        userNumber = Int(inputUserNumber) ?? 4
        
        return inputUserNumber
    }
    
    func isValidateUserNumber() -> Bool {
        if userNumber == 0 {
            print("게임 종료")
            return false
        } else if userNumber <= 4 {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return true
        }
        return true
    }
    
    func generateRandomNumber() {
        computerNumber = Int.random(in: 1...3)
    }
    
    func judgeWinOrLose() {
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


