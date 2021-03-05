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
            if playersHand == computersHand {
                print("\(winner)의 승리!")
                return false
            } else if playersHand > computersHand {
                winner = "플레이어"
                print("\(winner)의 턴입니다")
                return true
            } else {
                winner = "컴퓨터"
                print("\(winner)의 턴입니다")
                return true
            }
        }
        
    override func getHandByplayer() throws -> Hand? {
        return .none
    }
}
