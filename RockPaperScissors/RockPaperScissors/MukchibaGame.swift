//
//  MukchibaGame.swift
//  RockPaperScissors
//
//  Created by 김동욱 on 2022/02/16.
//

class MukchibaGame: Game {
    
    var turn: Turn
    
    init(turn: Turn) {
        self.turn = turn
    }
    
    override func printGameGuide() {
        print("[\(turn.message) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: "")
    }
    
    override func changeTurn(to player: Turn) {
        turn = player
    }
    
    override func printGameResult(gameResult: GameResult) {
        switch gameResult {
        case .win:
            changeTurn(to: .user)
            print("\(turn.message)의 턴입니다")
            start()
            
        case .lose:
            changeTurn(to: .computer)
            print("\(turn.message)의 턴입니다")
            start()
            
        case .draw:
            print("\(turn.message)의 승리!")
        }
    }
}
