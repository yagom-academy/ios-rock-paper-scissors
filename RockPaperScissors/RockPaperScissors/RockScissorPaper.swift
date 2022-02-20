//
//  RockPaperScissors - main.swift
//  Created by Lingo, 우롱차.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum HandType: Int, CaseIterable {
    case scissor = 1
    case rock = 2
    case paper = 3
    
    static var randomPick: Int? {
        return Self.allCases.randomElement()?.rawValue
    }
    
    static func contains(_ value: Int) -> Bool {
        let rawValues = allCases.map { $0.rawValue }
        return rawValues.contains(value)
    }
    
    static func convertMukZziPpaToStyle(_ value: Int) -> Int? {
        switch value {
        case 1:
            return 2
        case 2:
            return 1
        case 3:
            return 3
        default:
            return nil
        }
    }
}

func getPlayerInput(isMukZziPpa: Bool) -> Int? {
    guard let playerInput = readLine(),
          let playerIntInput = Int(playerInput)
    else {
        return nil
    }
    guard playerIntInput != Setting.exitCode else {
        return playerIntInput
    }
    guard HandType.contains(playerIntInput) else {
        return nil
    }
    
    if isMukZziPpa {
        return HandType.convertMukZziPpaToStyle(playerIntInput)
    } else {
        return playerIntInput
    }
}

func checkGameResult(player playerInput: Int, computer computerInput: Int) -> GameResult {
    let playerWinCondition = (computerInput % 3) + 1
    
    if playerInput == playerWinCondition {
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
    case .playerLose:
        print(GameDisplayMessage.playerDidLose)
    case .playerDraw:
        print(GameDisplayMessage.playerDidDraw)
    }
}

func startGame() {
    print(GameDisplayMessage.menu, terminator: "")

    guard let playerInput = getPlayerInput(isMukZziPpa: false) else {
        print(GameDisplayMessage.invalidPlayerInput)
        startGame()
        return
    }
    guard playerInput != Setting.exitCode else {
        print(GameDisplayMessage.gameDidEnd)
        return
    }
    guard let computerInput = HandType.randomPick else {
        print(GameDisplayMessage.error)
        return
    }
    
    let gameResult = checkGameResult(player: playerInput, computer: computerInput)
    showGameResult(gameResult)

    if gameResult == .playerDraw {
        startGame()
        return
    }
    
    if let mukZziPpaGameResult = startMukZziPpaGame(with: gameResult) {
        showMukZziPpaGameResult(mukZziPpaGameResult)
    }
}
