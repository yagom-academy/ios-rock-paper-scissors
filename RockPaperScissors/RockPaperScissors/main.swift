//
//  RockPaperScissors - main.swift
//  Created by Lingo, 우롱차.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum GameInput: String {
    case menu = "가위(1), 바위(2), 보(3)! <종료 : 0> :"
    case gameEnd = "게임 종료"
}

enum GameSetting: Int {
    case gameEnd = 0
}

func getUserInput() -> Int? {
    guard let userInput = readLine(), let userIntInput = Int(userInput)
    else {
        return nil
    }
    if userIntInput >= 0 && userIntInput <= 3 {
        return userIntInput
    }
    return nil
}

func startGame() {
    print(GameInput.menu.rawValue, terminator: " ")
    guard let userSelection = getUserInput()
    else {
        startGame()
        return
    }
    if userSelection == GameSetting.gameEnd.rawValue {
        print(GameInput.gameEnd.rawValue)
        return
    }
    let computerNumber = Int.random(in: 1...3)
}
