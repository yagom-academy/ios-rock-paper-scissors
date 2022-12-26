//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func choiceRockPaperScissors() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    guard let rockPaperScissors = readLine(), rockPaperScissors != "" else {
        return choiceRockPaperScissors()
    }

    guard let rockPaperScissorsNumber = Int(rockPaperScissors) else {
        return choiceRockPaperScissors()
    }
    
    return rockPaperScissorsNumber
}

func makeRandomRockPaperScissors() -> Int {
    let computerRandomNumber: Int
    computerRandomNumber = Int.random(in: 1...3)
    
    return computerRandomNumber
}

func playRockPaperScissors() {
    var computerNumber: Int = makeRandomRockPaperScissors()
    var userNumber: Int = choiceRockPaperScissors()
    var computerUserNumber: (Int, Int) = (computerNumber, userNumber)
    
    switch computerUserNumber {
    case (1, 1), (2, 2), (3, 3):
        print("비겼습니다!")
    case (1, 2), (2, 3), (3, 1):
        print("이겼습니다!")
    case (2, 1), (3, 2), (1, 3):
        print("졌습니다!")
    default:
       print("아무것도 아닙니다..")
    }
}

playRockPaperScissors()
