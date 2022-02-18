//
//  RockPaperScissors - main.swift
//  Created by Lingo, 우롱차.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

func getPlayerMukZziPpaInput() -> Int? {
    guard let playerInput = readLine(),
          let playerIntInput = Int(playerInput)
    else {
        return nil
    }
    guard playerIntInput != Setting.exitCode else {
        return playerIntInput
    }
    guard let playerMukZziPpaInput = HandType.convertMukZziPpaToHandType(playerIntInput) else {
        return nil
    }

    return playerMukZziPpaInput
}

func printMukZziPpaGameMenu(_ result: GameResult) {
    switch result {
    case .playerWin:
        print(GameDisplayMessage.playerTurnMukzzippaMenu, terminator: "")
    case .playerLose:
        print(GameDisplayMessage.computerTurnMukzzippaMenu, terminator: "")
    default:
        break
    }
}

func startMukZziPpaGame(with result: GameResult) -> GameResult? {
    printMukZziPpaGameMenu(result)
    guard let playerInput = getPlayerMukZziPpaInput() else {
        print(GameDisplayMessage.invalidPlayerInput)
        return startMukZziPpaGame(with: GameResult.playerLose)
    }
    guard playerInput != Setting.exitCode else {
        print(GameDisplayMessage.gameDidEnd)
        return nil
    }
    guard let computerInput = HandType.randomPick else {
        print(GameDisplayMessage.error)
        return nil
    }
    
    return checkMukZziPpaGameResult(
        player: playerInput,
        computer: computerInput,
        lastWinner: result
    )
}

func showMukZziPpaGameResult(_ result: GameResult) {
    switch result {
    case .playerWin:
        print(GameDisplayMessage.mukzzippaPlayerDidWin)
        print(GameDisplayMessage.gameDidEnd)
    case .playerLose:
        print(GameDisplayMessage.mukzzippaPlayerDidLose)
        print(GameDisplayMessage.gameDidEnd)
    default:
        break
    }
}

func checkMukZziPpaGameResult(
    player playerInput: Int,
    computer computerInput: Int,
    lastWinner: GameResult
) -> GameResult? {
    let playerWinCondition = (computerInput % 3) + 1
    
    if playerInput == computerInput, lastWinner == .playerWin {
        return .playerWin
    } else if playerInput == computerInput, lastWinner == .playerLose {
        return .playerLose
    } else if playerInput == playerWinCondition {
        print(GameDisplayMessage.isPlayerTurn)
        return startMukZziPpaGame(with: .playerWin)
    } else {
        print(GameDisplayMessage.isComputerTurn)
        return startMukZziPpaGame(with: .playerLose)
    }
}
