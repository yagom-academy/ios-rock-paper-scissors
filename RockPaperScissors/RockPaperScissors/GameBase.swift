//
//  Game.swift
//  RockPaperScissors
//
//  Created by 민다훈 on 2023/05/04.
//

class GameBase {
    var turn: Player
    var matchResult: Result
    
    init(turn: Player, matchResult: Result) {
        self.turn = turn
        self.matchResult = matchResult
    }
    
    func generateComputerRandomNumber() -> String {
        return String(Int.random(in: 1...3))
    }
}
