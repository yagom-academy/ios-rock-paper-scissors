//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors: Int {
    case gameOver = 0
    case scissors
    case rock
    case paper
}

func requestUserInput() -> Int{
    guard let inputString = readLine(), let inputNumber = Int(inputString), 0 <= inputNumber && inputNumber <= 3 else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return requestUserInput()
    }
    return inputNumber
}

let userNumber = requestUserInput()
