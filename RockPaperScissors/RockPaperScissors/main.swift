//
//  main.swift
//  Created by BaekGom, Finnn
//  Copyright © yagom academy. All rights reserved.
//



func startGame() {
    var gameTurn: GameTurn = .user
    let RockPaperScissorsGame = RockPaperScissorsGame()
    let MukchibaGame = MukchibaGame()
    
    if RockPaperScissorsGame.startRockPaperScissorsGame(gameTurn: &gameTurn) != .tie {
        MukchibaGame.startMukchibaGame(gameTurn: &gameTurn)
        EditionOfOutput.printGameOver()
    } else {
        startGame()
    }
}

startGame()
