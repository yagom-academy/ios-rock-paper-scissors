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
        
    override func getHandByPlayer() throws -> Hand? {
        print("[\(winner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
            
        guard var playerInput = readLine() else {
            throw GameError.invalidInput
        }
        
        switch(playerInput) {
        case "0":
            return nil
        case "1":
            playerInput = Hand.rock.rawValue
        case "2":
            playerInput = Hand.scissors.rawValue
        case "3":
            playerInput = Hand.paper.rawValue
        default:
            throw GameError.invalidInput
        }
        
        guard let playerHand = Hand(rawValue: playerInput) else {
            throw GameError.invalidInput
        }

        return playerHand
    }
}
