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
    
    func judgeWinOrLose() -> String {
        switch userNumber - computerNumber {
        case -1, 2:
            return "졌습니다!"
        case -2, 1:
            return "이겼습니다!"
        case 0:
            return "비겼습니다!"
        default:
            return "잘못된 입력입니다. 다시 시도해주세요."
        }
    }
}


