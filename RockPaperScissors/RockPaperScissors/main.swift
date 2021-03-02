//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 
import Foundation

class RockPaperScissors {
    var userValue: Int = 0
    var computerValue: Int = 0
    
    func makeRandomNumber() {
        let newRandomNumber: Int = Int.random(in: 1...3)
        computerValue = newRandomNumber
    }
    func startGame() {
        makeRandomNumber()
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        userValue = Int(readLine()!)!
        compareNumber()
    }
    func compareNumber() {
        if userValue == computerValue {
            print("비겼습니다!")
            return startGame()
        } else if userValue == 0 {
            print("게임종료")
            return
        } else if userValue == 1 && computerValue == 3 || userValue == 2 && computerValue == 1 || userValue == 3 && computerValue == 2 {
            print("이겼습니다!")
            return
        } else if userValue == 1 && computerValue == 2 || userValue == 2 && computerValue == 3 || userValue == 3 && computerValue == 1 {
            print("졌습니다!")
            return
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
               return startGame()
        }
    }
}
