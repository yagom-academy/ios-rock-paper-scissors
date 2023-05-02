//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

print("Hello, World!")

func inputMenu() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>: ", terminator: "")
    guard let inputNumber = readLine() else {
        print("error2")
        return 0
    }
    
            
    if inputNumber == "0" {
        print("게임 종료")
    }
    if inputNumber != "1" || inputNumber != "2" || inputNumber != "3" {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    guard let userNumber = Int(inputNumber) else {
        print("error3")
        return 0
    }
    return userNumber
}

func createRandomNumber() -> Int {
    var randomNumber = Int.random(in: 1...3)
    return randomNumber
}

func compareRandomNumber(_ userNumber: Int, to randomNumber: Int) {
    if userNumber == randomNumber {
        print("비겼습니다!")
    } else if (userNumber - randomNumber).magnitude == 2 && userNumber < randomNumber {
        print("이겼습니다!")
    } else if userNumber < randomNumber {
        print("졌습니다!")
    } else {
        print("error")
    }
}

