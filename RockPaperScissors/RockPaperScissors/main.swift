//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func choiceRockPaperScissors() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    guard let rockPaperScissors = readLine(), rockPaperScissors != "" else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return choiceRockPaperScissors()
    }

    guard let rockPaperScissorsNumber = Int(rockPaperScissors), rockPaperScissorsNumber >= 0, rockPaperScissorsNumber <= 3 else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
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
    let computerUserNumber: (Int, Int) = (makeRandomRockPaperScissors(), choiceRockPaperScissors())
    
    switch computerUserNumber {
    case (1, 1), (2, 2), (3, 3):
        print("비겼습니다!")
        playRockPaperScissors()
    case (1, 2), (2, 3), (3, 1):
        print("이겼습니다!")
    case (2, 1), (3, 2), (1, 3):
        print("졌습니다!")
    default:
        print("게임 종료")
    }
}

playRockPaperScissors()
