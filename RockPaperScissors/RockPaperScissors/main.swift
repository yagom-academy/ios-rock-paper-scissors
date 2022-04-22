//
//  main.swift
//  Created by BaekGom, Finnn
//  Copyright © yagom academy. All rights reserved.
//

var gameTurn: GameTurn = .user

func startGame() {
    let RockPaperScissorsGame = RockPaperScissorsGame()
    let MukchibaGame = MukchibaGame()
    
    if RockPaperScissorsGame.startRockPaperScissorsGame() != .tie {
        MukchibaGame.startMukchibaGame()
        EditionOfOutput.printGameOver()
    } else {
        startGame()
    }
}

startGame()
