//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateComputerCard() -> Int {
    Int.random(in: 1...3)
}

func receiveInputFromUser() -> String? {
    readLine()
}

func judgeUserInput() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>: ", terminator: "")
    guard let userInput = receiveInputFromUser(), let userCard = Int(userInput), userCard > 3 && userCard < 0 else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return judgeUserInput()
    }
    return userCard
}
