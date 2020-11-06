//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum PlayState {
    case win
    case lose
}

enum Hand: String {
    case sisssors = "1"
    case rock = "2"
    case paper = "3"
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

func mukchiba() {
    // winner에 승리자가 player이면 1, computer이면 2
    var winner: Int = rockScissorPaperGame()
    var condition: Int = 3 // rspWinnerChecker에서 받아오는 값
    
    while true {
        if winner == 1 { print("[사용자 턴] ", terminator: "") }
        else { print("[컴퓨터 턴] ", terminator: "") }
        print("묵(1), 찌(2), 빠(3)! <종료: 0> : ", terminator: "")
        
        guard let input = readLine() else { return }
        
        switch input {
        case "0":
            print("게임 종료")
            break
        case "1":
            condition = mcbWinnerChecker(1)
        case "2":
            condition = mcbWinnerChecker(2)
        case "3":
            condition = mcbWinnerChecker(3)
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
        
        switch condition {
        case 0:
            if winner == 1 { print("사용자의 ", terminator: "") }
            else { print("컴퓨터의 ", terminator: "") }
            print("승리!")
            return
        case 1:
            winner = 1
        default:
            winner = 2
        }
    }
}

mukchiba()
