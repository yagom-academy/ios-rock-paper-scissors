//
//  GameManager.swift
//  RockPaperScissors
//
//  Created by 민다훈 on 2023/05/03.
//

class GameManager {
    private var turn: Player?
    private var matchResult: Result?
    private var rockPaperScissorsGame: RockPaperScissorsGame = RockPaperScissorsGame(turn: .user, matchResult: .draw)
    private var mukJjiPpaGame: MukJjiPpaGame?
    
    func playGame() {
        (turn, matchResult) = rockPaperScissorsGame.startRockPaperScissors()
        
        guard let owner = turn, let result = matchResult, result != .giveUp else { return }
                
        mukJjiPpaGame = MukJjiPpaGame(turn: owner, matchResult: result)
        mukJjiPpaGame?.startMukJjiPpa()
    }
}
