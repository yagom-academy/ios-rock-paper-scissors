//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var rockPaperScissorsmanager = RockPaperScissorsManager()
var mukchippaManager = MukchippaManager()

rockPaperScissorsmanager.startGame()

if rockPaperScissorsmanager.isWinOrLose {
    mukchippaManager.isUserTurn = true
    mukchippaManager.startMukchippa()
} else {
    mukchippaManager.isUserTurn = false
    mukchippaManager.startMukchippa()
}
