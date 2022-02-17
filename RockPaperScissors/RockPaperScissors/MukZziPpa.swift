//
//  RockPaperScissors - main.swift
//  Created by Lingo, 우롱차.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum MukZziPpaHandType: Int, CaseIterable {
    case muk = 1
    case zzi = 2
    case ppa = 3
    
    static var randomPick: Int? {
        return Self.allCases.randomElement()?.rawValue
    }
}

func getPlayerMukZziPpaInput() -> Int? {
    guard let playerInput = readLine(),
          let playerIntInput = Int(playerInput)
    else {
        return nil
    }
    
    if playerIntInput == Settings.exitCode {
        return playerIntInput
    }
    
    guard let _ = MukZziPpaHandType(rawValue: playerIntInput) else {
        return nil
    }

    return playerIntInput
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

func startMukZziPpaGame(_ result: GameResult) -> GameResult? {
    printMukZziPpaGameMenu(result)
    guard let playerInput = getPlayerMukZziPpaInput() else {
        print(GameDisplayMessage.invalidPlayerInput)
        return startMukZziPpaGame(GameResult.playerLose)
    }
    if playerInput == Settings.exitCode {
        print(GameDisplayMessage.gameDidEnd)
        return nil
    }
    guard let computerInput = MukZziPpaHandType.randomPick else {
        print(GameDisplayMessage.error)
        return nil
    }
    return checkMukZziPpaGameResult(player: playerInput, computer: computerInput, lastWinner: result)
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

func checkMukZziPpaGameResult(player playerInput: Int, computer computerInput: Int, lastWinner: GameResult) -> GameResult? {
    let computerWinCondition = (computerInput % 3) + 1
    
    if playerInput == computerInput, lastWinner == .playerWin {
        return .playerWin
    } else if playerInput == computerInput, lastWinner == .playerLose{
        return .playerLose
    } else if playerInput == computerWinCondition {
        print(GameDisplayMessage.isComputerTurn)
        return startMukZziPpaGame(.playerLose)
    } else {
        print(GameDisplayMessage.isPlayerTurn)
        return startMukZziPpaGame(.playerWin)
    }
}
