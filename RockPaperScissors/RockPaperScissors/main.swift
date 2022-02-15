//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func playRockPaperScissors() {
    print("가위(1),바위(2),보(3)!<종료 :0>:", terminator: "")
    let userInput = readLine()
    guard let userHand = userInput else {
        print("잘못된 입력입니다. 다시 시도해 주세요.")
        return playRockPaperScissors()
    }
    let computerHand = String(Int.random(in: 1...3))
    
    match(userHand: userHand, computerHand: computerHand)
}

func match(userHand: String, computerHand: String) {
    
}
