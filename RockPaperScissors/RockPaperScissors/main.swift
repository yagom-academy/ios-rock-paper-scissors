//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var firstFlag: Bool = true
var randomNumberOfComputer: Int = 0

func startGame() {
    while true {
        if firstFlag {
            randomNumberOfComputer = Int.random(in: 1...3)
            firstFlag = false
        }
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        let userInput: Int? = Int(readLine()!)
        guard let userInputIsInt = userInput else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        if userInputIsInt == 0 {
            print("게임 종료")
            return
        } else if userInputIsInt < 1 || userInputIsInt > 3 {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        } else if userInputIsInt == 1 {
            if randomNumberOfComputer == 1 {
                print("비겼습니다!")
                continue
            } else if randomNumberOfComputer == 2 {
                print("졌습니다!")
                return
            } else if randomNumberOfComputer == 3 {
                print("이겼습니다!")
                return
            }
        } else if userInputIsInt == 2 {
            if randomNumberOfComputer == 2 {
                print("비겼습니다!")
                continue
            } else if randomNumberOfComputer == 3 {
                print("졌습니다!")
                return
            } else if randomNumberOfComputer == 1 {
                print("이겼습니다!")
                return
            }
        } else if userInputIsInt == 3 {
            if randomNumberOfComputer == 3 {
                print("비겼습니다!")
                continue
            } else if randomNumberOfComputer == 1 {
                print("졌습니다!")
                return
            } else if randomNumberOfComputer == 2 {
                print("이겼습니다!")
                return
            }
        }

    }
}

startGame()
