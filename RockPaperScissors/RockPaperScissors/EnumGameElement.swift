//
//  EnumGameElement.swift
//  RockPaperScissors
//
//  Created by riji, rilla on 2022/12/29.
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
