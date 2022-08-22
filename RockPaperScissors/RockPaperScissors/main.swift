//
//  RockPaperScissors - main.swift
//  Created by 애종, Mangdi.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func startRockScissorsPaperGame() {
    let computerAnswer = Int.random(in: 1...3)
    
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
    guard let input = readLine() else {
        return
    }
    guard let userAnswer = Int(input.replacingOccurrences(of: " ", with: "")) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return
    }
    
    switch userAnswer {
    case 0:
        print("게임 종료")
        break
    case 1:
        
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        break
    }
}

startRockScissorsPaperGame()
func judgeWhoWins(_ computerAnswer: Int, a useran) {
    // 가위, 바위, 보
    if computerAnswer == 1 {
        print("비겼습니다!")
    }
    if computerAnswer == 2 {
        print("졌습니다!")
    }
    if computerAnswer == 3 {
        print("이겼습니다!")
    }
}
