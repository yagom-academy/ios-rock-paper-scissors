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

enum GameOptions: Int {
    case gameEnd = 0
    case scissor = 1
    case lock = 2
    case paper = 3
}

enum GameResult {
    case win
    case lose
    case draw
}

func getUserInput() -> Int? {
    guard let userInput = readLine(), let userIntInput = Int(userInput)
    else {
        return nil
    }
    if userIntInput >= GameOptions.gameEnd.rawValue && userIntInput <= GameOptions.paper.rawValue {
        return userIntInput
    }
    return nil
}

func checkGameResult(player playerInput: Int, computer computerInput: Int) -> GameResult {
    if playerInput == computerInput {
        return GameResult.draw
    } else if (playerInput == GameOptions.scissor.rawValue && computerInput == GameOptions.lock.rawValue) ||
              (playerInput == GameOptions.lock.rawValue && computerInput == GameOptions.paper.rawValue) ||
              (playerInput == GameOptions.paper.rawValue && computerInput == GameOptions.scissor.rawValue)
    {
        return GameResult.lose
    } else {
        return GameResult.win
    }
}

func showGameResult(result: GameResult) {
    switch result {
    case .win:
        print(GameDisplaySetting.gameWin.rawValue)
        print(GameDisplaySetting.gameEnd.rawValue)
    case .lose:
        print(GameDisplaySetting.gameLose.rawValue)
        print(GameDisplaySetting.gameEnd.rawValue)
    case .draw:
        print(GameDisplaySetting.gameDraw.rawValue)
        startGame()
    }
}

func startGame() {
    print(GameDisplaySetting.menu.rawValue, terminator: " ")
    guard let playerInput = getUserInput()
    else {
        print(GameDisplaySetting.gameWrongInput.rawValue)
        startGame()
        return
    }
    if playerInput == GameOptions.gameEnd.rawValue {
        print(GameDisplaySetting.gameEnd.rawValue)
        return
    }
    let computerInput = Int.random(in: 1...3)
    let gameResult = checkGameResult(player: playerInput, computer: computerInput)
    showGameResult(result: gameResult)
}

startGame()
