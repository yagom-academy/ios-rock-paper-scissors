//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © Derrick kim, ZZBAE. All rights reserved.
// 

import Foundation

let rockPaperScissorsGame: Runnable = RockPaperScissorsGameModel()


if let player = rockPaperScissorsGame.start() {
    let mukjjibar = MukjipaGameModel(player: player)
    mukjjibar.start()
}
    



