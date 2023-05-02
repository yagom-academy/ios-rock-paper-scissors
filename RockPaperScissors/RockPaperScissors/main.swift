//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum HandShape: Int {
    case scissors = 1, rock, paper
}

gameLoop: while true {

    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    let computer = HandShape(rawValue: Int.random(in: 1...3))!
    let input = readLine()
    
    switch input {
    case "0":
        print("게임 종료")
        break gameLoop
    case "1", "2", "3":
        print("computer: \(computer)")
        let user = HandShape(rawValue: Int(input!)!)!
        showResult(input: user, computer: computer)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
}

func showResult(input: HandShape, computer: HandShape) {
    if input == .rock {
        if computer == .rock {
            print("비겼습니다!")
        } else if computer == .scissors {
            print("이겼습니다!")
        } else {
            print("졌습니다!")
        }
    } else if input == .scissors {
        if computer == .scissors {
            print("비겼습니다!")
        } else if computer == .paper {
            print("이겼습니다!")
        } else {
            print("졌습니다!")
        }
    } else {
        if computer == .paper {
            print("비겼습니다!")
        } else if computer == .rock {
            print("이겼습니다!")
        } else {
            print("졌습니다!")
        }
    }
}
