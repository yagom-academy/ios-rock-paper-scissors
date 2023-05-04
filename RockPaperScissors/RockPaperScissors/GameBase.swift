//
//  Game.swift
//  RockPaperScissors
//
//  Created by minsong kim on 2023/05/04.
//

class GameBase {
    var turn: Player
    var selectedGame: GameList
    var matchResult: Result = .win
    
    init(turn: Player, selectedGame: GameList) {
        self.turn = turn
        self.selectedGame = selectedGame
    }

    func generateComputerRandomNumber() -> String {
        return String(Int.random(in: 1...3))
    }
}
