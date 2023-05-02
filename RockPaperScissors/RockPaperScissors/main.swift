//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

//TODO: 함수이름

import Foundation

gameLoop: while true {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    let computer = String(Int.random(in: 1...3))
    let input = readLine()
    
    switch input {
    case "0":
        print("게임 종료")
        break gameLoop
    case "1", "2", "3":
        if let user = input, judgeGame(user, with: computer) {
            break gameLoop
        }
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

func judgeGame(_ user: String, with computer: String) -> Bool {
    switch (user, computer) {
    case ("1", "1"), ("2", "2"), ("3", "3"):
        print("비겼습니다!")
        return false
    case ("1", "3"), ("3", "2"), ("2", "1"):
        print("이겼습니다!")
        return true
    default:
        print("졌습니다!")
        return true
    }
}

