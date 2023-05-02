//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

print("Hello, World!")

func inputMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>: ", terminator: "")
    let userNumber = readLine()
    
    switch userNumber {
    case "1":
        print("case1")
    case "2":
        print("case2")
    case "3":
        print("case3")
    case "0":
        print("게임 종료")
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
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
    }
}

feat: 비교함수 생성
