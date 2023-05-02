//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func inputMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>: ", terminator: "")
    guard let inputNumber = readLine() else { return }
    guard let userCard = Int(inputNumber) else { return }
    
    switch userCard {
    case 1:
        compareRandomNumber(userCard, with: createRandomNumber())
        inputMenu()
    case 2:
        compareRandomNumber(userCard, with: createRandomNumber())
        inputMenu()
    case 3:
        compareRandomNumber(userCard, with: createRandomNumber())
        inputMenu()
    case 0:
        print("게임 종료")
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        inputMenu()
    }
}

func createRandomNumber() -> Int {
    let randomNumber = Int.random(in: 1...3)
    print(randomNumber)
    return randomNumber
}

func compareRandomNumber(_ inputNumber: Int, with randomNumber: Int) {
    if inputNumber == randomNumber {
        print("비겼습니다!")
    } else if ((inputNumber - randomNumber).magnitude == 2) && (inputNumber == 1) {
        print("이겼습니다!")
    } else if ((inputNumber - randomNumber).magnitude == 2) && (inputNumber == 3) {
        print("졌습니다!")
    } else if (inputNumber > randomNumber) {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}

inputMenu()
