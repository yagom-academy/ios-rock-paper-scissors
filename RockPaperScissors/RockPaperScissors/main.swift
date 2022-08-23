//
//  RockPaperScissors - main.swift
//  Created by Wonbi, mini.
//

protocol GameAble {
	func startGame()
}

let baseGame: GameAble = RockPaperScissors()
baseGame.startGame()
