//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let user: User = User()
let computer: Computer = Computer()
let rockPaperScissorsGame: RockPaperScissorsGame = RockPaperScissorsGame(user: user, computer: computer)

rockPaperScissorsGame.startProgram()
