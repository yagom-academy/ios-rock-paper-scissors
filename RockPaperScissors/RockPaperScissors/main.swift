//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Message: String {
    case menu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
    case gameOver = "게임 종료"
    case userWin = "이겼습니다!"
    case userLose = "졌습니다."
    case draw = "비겼습니다."
}

func playGame() {
    print(Message.menu.rawValue, terminator: "")
    guard let input = readLine(), let inputNumber = Int(input), inputNumber >= 0 && inputNumber <= 3 else {
        print(Message.wrongInput.rawValue)
        return playGame()
    }
    
    let computerNumber = Int.random(in: 1...3)
    print(computerNumber)
    switch (inputNumber, computerNumber) {
    case (0,_):
        print(Message.gameOver.rawValue)
    case (1,3), (3,2), (2,1):
        print(Message.userWin.rawValue)
    case (1,2), (2,3), (3,1):
        print(Message.userLose.rawValue)
    default:
        print(Message.draw.rawValue)
        playGame()
    }
}

playGame()
