//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


enum Message: String {
    case menu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case inputError = "잘못된 입력입니다. 다시 시도해주세요."
    case gameEnd = "게임 종료"
    case userWin = "이겼습니다!"
    case userLose = "졌습니다!"
    case draw = "비겼습니다!"
}

func startGame() {
    let inputRange = 0...3
    print(Message.menu.rawValue, terminator: "")

    guard var userInput = readLine() else { return }
    userInput = String(userInput)
    
    if userInput == "0" {
    } else if (inputRange.map{String($0)}).contains(userInput) {
        compareEachHand(userHand: userInput)
    } else {
        print(Message.inputError.rawValue)
        startGame()
    }
    print(Message.gameEnd.rawValue)

}
