//
//  RockPaperScissors - main.swift
//  Created by Riji,Rilla.
//  Copyright © yagom academy. All rights reserved.
// 


enum GameMenu: String {
    case scissor = "1"
    case rock = "2"
    case paper = "3"
    case endGame = "0"
}

enum GameResult {
    case win, draw, lose
}

enum GameError : Error {
    case invalidInput
}

