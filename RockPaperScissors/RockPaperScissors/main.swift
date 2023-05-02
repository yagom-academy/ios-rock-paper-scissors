//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

gameLoop: while true {
    let computer = String(Int.random(in: 1...3))
    print("computer: \(computer)")
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    let input = readLine()
    switch input {
    case "0":
        print("게임 종료")
        break gameLoop
    case "1", "2", "3":
        check(input: input, computer: computer)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

func check(input: String?, computer: String) {
    if let input2 = input, input2 == computer {
        print("비겼습니다!")
    } else if let input2 = input, input2 > computer {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}
