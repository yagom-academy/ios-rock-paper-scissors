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
    static let playerTurnSubMenu = "[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
    static let computerTurnSubMenu = "[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
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
    
    static var randomPick: Int? {
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
          let playerGameOptionsInput = HandType(rawValue: playerIntInput)
    else {
        return nil
    }

    guard HandType.allCases.contains(playerGameOptionsInput) || playerIntInput == Settings.exitCode
    else {
        return nil
    }
    
    return playerIntInput
}

func checkGameResult(player playerInput: Int, computer computerInput: Int) -> GameResult {
    let computerLoseCondition = (computerInput % 3) + 1
    
    if playerInput == computerLoseCondition {
        return .playerWin
    } else if playerInput == computerInput {
        return .playerDraw
    } else {
        return .playerLose
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
    guard let computerInput = HandType.randomPick else{
        print(GameDisplayMessage.error)
        return
    }
    let gameResult = checkGameResult(player: playerInput, computer: computerInput)
    
    showGameResult(gameResult)
    
    if gameResult == .playerDraw {
        startGame()
        return
    }
    
    guard let subGameResult = startSubGame(gameResult) else {
        return
    }
    
    showSubGameResult(subGameResult)
}

// MARK: - Sub
func getPlayerSubInput() -> Int? {
    guard let playerInput = readLine(),
          let playerIntInput = Int(playerInput)
    else {
        return nil
    }
    
    if playerIntInput == Settings.exitCode {
        return playerIntInput
    }
    
    guard let _ = SubGameHandType(rawValue: playerIntInput) else {
        return nil
    }

    return playerIntInput
}

func printSubGameMenu(_ result: GameResult) {
    switch result {
    case .playerWin:
        print(GameDisplayMessage.playerTurnSubMenu, terminator: "")
    case .playerLose:
        print(GameDisplayMessage.computerTurnSubMenu, terminator: "")
    default:
        break
    }
}

func startSubGame(_ result: GameResult) -> GameResult? {
    printSubGameMenu(result)
    guard let playerInput = getPlayerSubInput() else {
        print(GameDisplayMessage.invalidPlayerInput)
        return startSubGame(GameResult.playerLose)
    }
    if playerInput == Settings.exitCode {
        print(GameDisplayMessage.gameDidEnd)
        return nil
    }
    guard let computerInput = SubGameHandType.randomPick else {
        print(GameDisplayMessage.error)
        return nil
    }
    return checkSubGameResult(player: playerInput, computer: computerInput, lastWinner: result)
}

func showSubGameResult(_ result: GameResult) {
    switch result {
    case .playerWin:
        print(GameDisplayMessage.playerDidWin) //TODO
    case .playerLose:
        print(GameDisplayMessage.playerDidLose)
    case .playerDraw:
        print(GameDisplayMessage.playerDidDraw)
    }
}

func checkSubGameResult(player playerInput: Int, computer computerInput: Int, lastWinner: GameResult) -> GameResult? {
    let computerLoseCondition = (computerInput % 3) + 1
    
    print("사용자: \(SubGameHandType(rawValue: playerInput)!), 컴퓨터 \(SubGameHandType(rawValue: computerInput)!)")
    
    if playerInput == computerInput, lastWinner == .playerWin {
        return .playerWin
    } else if playerInput == computerInput, lastWinner == .playerLose{
        return .playerLose
    } else if playerInput == computerLoseCondition {
        print(GameDisplayMessage.isPlayerTurn)
        return startSubGame(.playerWin)
    } else {
        print(GameDisplayMessage.isComputerTurn)
        return startSubGame(.playerLose)
    }
}

startGame()
