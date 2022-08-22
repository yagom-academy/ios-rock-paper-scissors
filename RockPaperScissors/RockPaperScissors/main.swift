//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printRockScissorPaper() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
}

func getUserNumberWithValidation() -> Int? {
    guard let input = readLine(),
          let userNumber = Int(input),
          userNumber > 3,
          userNumber < 0
    else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return nil
    }
    return userNumber
}

func playRockScissorPaper() {
    let computerHand: Int = Int.random(in: 1...3)
    printRockScissorPaper()
    guard let userHand = getUserNumberWithValidation() else { return }
}

playRockScissorPaper()
