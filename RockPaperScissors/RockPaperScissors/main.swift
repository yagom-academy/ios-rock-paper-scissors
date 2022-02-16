//
//  RockPaperScissors - main.swift
//  Created by Lingo, 우롱차.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Settings {
    static let exitCode = 0
}

enum GameDisplayMessage {
    static let menu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    static let gameDidEnd = "게임 종료"
    static let playerDidWin = "이겼습니다!"
    static let playerDidLose = "졌습니다!"
    static let playerDidDraw = "비겼습니다!"
    static let invalidPlayerInput = "잘못된 입력입니다. 다시 시도해주세요."
    static let error = "에러가 발생했습니다. 게임을 다시 실행시켜 주세요."
}

enum HandType: Int, CaseIterable {
    case scissor = 1
    case rock = 2
    case paper = 3
    
    static var randomHandType: Int? {
        return Self.allCases.randomElement()?.rawValue
    }
}

enum GameResult {
    case playerWin
    case playerLose
    case playerDraw
}

func getPlayerInput() -> Int? {
    guard let playerInput = readLine(),
          let playerIntInput = Int(playerInput),
          let playerGameOptionsInput = HandType(rawValue: playerIntInput),
          (HandType.allCases.contains(playerGameOptionsInput) || playerIntInput == Settings.exitCode) else {
        return nil
    }
    return playerIntInput
}

func checkGameResult(player playerInput: Int, computer computerInput: Int) -> GameResult {
    let computerLoseCondition = (computerInput % 3) + 1

    if playerInput == computerLoseCondition {
        return GameResult.playerWin
    } else if playerInput == computerInput {
        return GameResult.playerDraw
    } else {
        return GameResult.playerLose
    }
}

func showGameResult(_ result: GameResult) {
    switch result {
    case .playerWin:
        print(GameDisplayMessage.playerDidWin)
        print(GameDisplayMessage.gameDidEnd)
    case .playerLose:
        print(GameDisplayMessage.playerDidLose)
        print(GameDisplayMessage.gameDidEnd)
    case .playerDraw:
        print(GameDisplayMessage.playerDidDraw)
        startGame()
    }
}

func startGame() {
    print(GameDisplayMessage.menu, terminator: "")

    guard let playerInput = getPlayerInput()
    else {
        print(GameDisplayMessage.invalidPlayerInput)
        startGame()
        return
    }
    if playerInput == Settings.exitCode {
        print(GameDisplayMessage.gameDidEnd)
        return
    }
    guard let computerInput = HandType.randomHandType else{
        print(GameDisplayMessage.error)
        return
    }
    let gameResult = checkGameResult(player: playerInput, computer: computerInput)
    showGameResult(gameResult)
}

startGame()
