//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let rockPaperScissorsMessage = "가위(1), 바위(2), 보(3)! <종료 : 0>: "
let wrongInputMessage = "잘못된 입력입니다. 다시 시도해주세요."
let noTerminator = ""

func generateComputerCard() -> Int {
    Int.random(in: 1...3)
}

func receiveInputFromUser() -> String? {
    readLine()
}

func judgeUserInput() -> Int {
    print(rockPaperScissorsMessage, terminator: noTerminator)
    guard let userInput = receiveInputFromUser(), let userCard = Int(userInput), userCard > 3 && userCard < 0 else {
        print(wrongInputMessage)
        return judgeUserInput()
    }
    return userCard
}

enum GameResult: String {
    case userWin = "이겼습니다!"
    case computerWin = "졌습니다!"
    case draw = "비겼습니다!"
}
