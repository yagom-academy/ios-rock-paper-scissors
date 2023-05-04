//
//  GameManager.swift
//  RockPaperScissors
//
//  Created by Yena on 2023/05/03.
//

class GameManager {
    private var turn: Player = .user
    private var selectedGame: GameList = .rockPaperScissors
    private var rockPaperScissorsGame: RockPaperScissorsGame
    private var mukJjiPpaGame: MukJjiPpaGame
    
    init() {
        rockPaperScissorsGame = RockPaperScissorsGame(turn: turn, selectedGame: selectedGame)
        mukJjiPpaGame = MukJjiPpaGame(turn: turn, selectedGame: selectedGame)
    }
    
    func playGame() {
        while selectedGame != .termination {
            if selectedGame == .rockPaperScissors {
                (turn, selectedGame) = rockPaperScissorsGame.playRockPaperScissors()
            } else {
                (turn, selectedGame) = mukJjiPpaGame.playMukJjiPpa(turn)
            }
        }
    }
}
