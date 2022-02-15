//
//  RockPaperScissors - main.swift
//  Created by Lingo, 우롱차.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum GameDisplaySetting: String {
    case menu = "가위(1), 바위(2), 보(3)! <종료 : 0> :"
    case gameEnd = "게임 종료"
    case gameWin = "이겼습니다!"
    case gameLose = "졌습니다!"
    case gameDraw = "비겼습니다!"
    case gameWrongInput = "잘못된 입력입니다. 다시 시도해주세요."
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

func checkGameResult(player playerInput: Int, computer computerInput: Int) {
    if playerInput == computerInput {
        print(GameDisplaySetting.gameDraw.rawValue)
        startGame()
    } else if (playerInput == 1 && computerInput == 2) ||
              (playerInput == 2 && computerInput == 3) ||
              (playerInput == 3 && computerInput == 1)
    {
        print(GameDisplaySetting.gameLose.rawValue)
        print(GameDisplaySetting.gameEnd.rawValue)
    } else {
        print(GameDisplaySetting.gameWin.rawValue)
        print(GameDisplaySetting.gameEnd.rawValue)
    }
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
    let computerInput = Int.random(in: 1...3)
    checkGameResult(player: playerInput, computer: computerInput)
}
