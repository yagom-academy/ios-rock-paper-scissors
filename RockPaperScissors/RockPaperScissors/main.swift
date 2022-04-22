//
//  main.swift
//  Created by BaekGom, Finnn
//  Copyright © yagom academy. All rights reserved.
//

let randomNumberRange: ClosedRange<Int> = 1...3
var gameTurn: String = ""

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
