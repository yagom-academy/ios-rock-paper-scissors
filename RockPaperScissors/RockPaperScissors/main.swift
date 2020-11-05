//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 가위(1), 바위(2), 보(3)
// return 값: 비긴경우 0, 사람이 이긴경우 1, 컴퓨터가 이긴경우 2
func rspWinnerChecker(_ player: Int) -> Int {
    let computer = Int.random(in: 1...3)
    
    // 비긴경우
    if player == computer { return 0 }
    // 사용자가 보 일때 판단
    if player == 3 {
        if computer == 2 { return 1 }
        else { return 2 }
    }
    // 그 외
    if (player - computer) == -1 { return 2 }
    return 1
}

// 묵(1), 찌(2), 빠(3)
// return 값: 비긴경우 0, 사람이 이긴경우 1, 컴퓨터가 이긴경우 2
func mcbWinnerChecker(_ player: Int) -> Int {
    let computer = Int.random(in: 1...3)
    
    // 비긴경우
    if player == computer { return 0 }
    // 사용자가 보 일때 판단
    if player == 3 {
        if computer == 1 { return 1 }
        else { return 2 }
    }
    // 그 외
    if (player - computer) == -1 { return 1 }
    return 2
}

// return 값: 에러 -1, 사용자 승리 1, 컴퓨터 승리 2 -> 묵찌빠에서 사용하기 위해
func rockScissorPaperGame() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
    
    var condition: Int = 3 // rspWinnerChecker에서 받아오는 값
    guard let input = readLine() else { return -1 }
    
    switch input {
    case "0":
        print("게임 종료")
        return -1
    case "1":
        condition = rspWinnerChecker(1)
    case "2":
        condition = rspWinnerChecker(2)
    case "3":
        condition = rspWinnerChecker(3)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        rockScissorPaperGame()
    }
    
    switch condition {
    case 0:
        print("비겼습니다!")
    case 1:
        print("이겼습니다!")
    case 2:
        print("졌습니다!")
    default:
        rockScissorPaperGame()
    }
    if condition == 0 { condition = rockScissorPaperGame() }
    return condition
}

