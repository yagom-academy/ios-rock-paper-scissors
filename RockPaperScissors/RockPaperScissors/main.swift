//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors: Int {
    case scissors = 1
    case rock
    case paper
}

var isGameOver = false

func requestUserInput() -> Int{
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let inputString = readLine(), let inputNumber = Int(inputString), 0 <= inputNumber && inputNumber <= 3 else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return requestUserInput()
    }
    return inputNumber
}

func compareUserInputWithComputerInput(userNumber: Int, computerRandomNumber: Int) {
    guard let user = RockPaperScissors(rawValue: userNumber), let computer = RockPaperScissors(rawValue: computerRandomNumber) else {
        return
    }
    if user == computer {
        print("비겼습니다!")
        return
    }
    else if (user == .scissors && computer == .paper) || (user == .paper && computer == .rock) || (user == .rock && computer == .scissors)
    {
        print("이겼습니다!")
        isGameOver = true
        return
    }
    else {
        print("졌습니다!")
        isGameOver = true
        return
    }
}
func gameStart() {
    while isGameOver == false {
        let userNumber = requestUserInput()
        if userNumber == 0 {
            print("게임 종료")
            break
        }
        let computerRandomNumber = Int.random(in: 1...3)
        compareUserInputWithComputerInput(userNumber: userNumber, computerRandomNumber: computerRandomNumber)
    }
}

gameStart()
