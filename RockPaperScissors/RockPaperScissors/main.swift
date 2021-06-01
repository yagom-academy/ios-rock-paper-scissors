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
}

playGame()
