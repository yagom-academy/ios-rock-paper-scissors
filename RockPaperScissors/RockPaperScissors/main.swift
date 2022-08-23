//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

startGame()

func startGame() {
    printRockScissorPaper()
    guard let userHandNumber = getUserHandNumber() else {
        startGame()
        return
    }
    guard let hands = setHandType(userHandNumber) else { return }
    compareHandsForRSP(from: hands)
}

func playMGP(turn: Turn) {
    printMGP(turn: turn)
    guard let userHandNumber = getUserHandNumber() else {
        playMGP(turn: Turn.computer)
        return
    }
    guard let hands = setHandType(userHandNumber) else { return }
    compareHandsForMGP(from: hands, with: turn)
}
