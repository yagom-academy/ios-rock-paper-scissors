//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

print("Hello, World!")

func inputMenu() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>: ", terminator: "")
    let inputNumber = readLine()
    
    switch inputNumber {
    case "1":
        compareRandomNumber(<#T##Int#>, to: <#T##Int#>)
        inputMenu()
    case "2":
        compareRandomNumber(<#T##Int#>, to: <#T##Int#>)
        inputMenu()
    case "3":
        compareRandomNumber(<#T##Int#>, to: <#T##Int#>)
        inputMenu()
    case "0":
        print("게임 종료")
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        inputMenu()
    }
    return Int(inputNumber)
}

func createRandomNumber() -> Int {
    let randomNumber = Int.random(in: 1...3)
    return randomNumber
}

func compareRandomNumber(_ inputNumber: Int, to randomNumber: Int) {
    if inputNumber == randomNumber {
        print("비겼습니다!")
    } else if (inputNumber - randomNumber).magnitude == 2 && inputNumber < randomNumber {
        print("이겼습니다!")
    } else if inputNumber < randomNumber {
        print("졌습니다!")
    } else if inputNumber > randomNumber {
        print("이겼습니다!")
    }
}

inputMenu()

feat: 메뉴입력함수, 비교함수 수정
