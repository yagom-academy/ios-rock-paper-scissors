//
//  MukjjibbaGame.swift
//  RockPaperScissors
//
//  Created by 강경 on 2021/03/05.
//

class MukjjibbaGame: RockPaperScissorsGame {
    var winner: String
    
    init(winner: gamePlayer) {
        self.winner = winner.rawValue
    }
    
    override func gameResult(_ playersHand: Hand, vs computersHand: Hand) -> Bool {
        return false
    }
        
    override func getHandByplayer() throws -> Hand? {
        return .none
    }
}
