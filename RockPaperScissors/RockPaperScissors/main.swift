//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

gameLoop: while true {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    let input = readLine()
    switch input {
    case "0":
        print("게임 종료")
        break gameLoop
    case "1":
        print(1)
    case "2":
        print(2)
    case "3":
        print(3)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

