//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let user = User()
let computer = Computer()
let userInterface = UserInterface()
let rockPaperScissorsGame = RockPaperScissorsGame(
    user: user,
    computer: computer,
    userInterface: userInterface
)

rockPaperScissorsGame.startProgram()
