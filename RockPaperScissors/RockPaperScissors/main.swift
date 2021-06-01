//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func playGame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let input = readLine(), let inputNumber = Int(input) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return playGame()
    }
    let computerNumber = Int.random(in: 1...3)
    switch (inputNumber, computerNumber) {
    case (0, _):
        print("게임 종료")
    case (1,3), (3,2), (2,1):
        print("이겼습니다!")
    case (1,2), (2,3), (3,1):
        print("졌습니다.")
    case let (user,computer) where user == computer:
        print("비겼습니다.")
        playGame()
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        playGame()
    }
}

playGame()
