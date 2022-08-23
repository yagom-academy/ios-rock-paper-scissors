//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func startGame() {
    RCPgame()
}

func RCPgame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let input = readLine(), input.count == 1, let userNumber = Int(input) else { return }
    switch userNumber {
    case 1, 2, 3:
        judgeWinner(userNumber, generateRandomComputerNumber())
    case 0:
        print("게임 종료")
        return
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
    }
}

func judgeWinner(_ userNumber: Int, _ computerNumber: Int) {
    let criterionNumber = userNumber - computerNumber
    switch criterionNumber {
    case -1, 2 :
        print("이겼습니다!")
        return
    case 1, -2 :
        print("졌습니다!")
        return
    case 0 :
        print("비겼습니다!")
        startGame()
    default:
        return
    }
}

func generateRandomComputerNumber() -> Int {
    return Int.random(in: 1...3)
}

startGame()
