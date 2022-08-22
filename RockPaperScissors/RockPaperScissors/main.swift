//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func startGame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ")
    guard let input = readLine(), input.count == 1, let userNumber = Int(input) else { return }
    let computerNumber = Int.random(in: 1...3)
    var compareUserToComputer: Int = userNumber - computerNumber
    
    switch userNumber {
    case 1, 2, 3:
        return
    case 0:
        print("게임 종료")
        return
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
    }
}

startGame()
