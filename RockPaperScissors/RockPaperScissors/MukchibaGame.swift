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
    
    override func printGameInfo() {
        print("[\(turn.check) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: "")
    }
    
    override func changeTurn() {
        turn = .computer
    }
    
    override func printGameResult(gameResult: GameResult) {
        switch gameResult {
        case .win:
            turn = .user
            print("사용자의 턴입니다")
            start()
            
        case .lose:
            turn = .computer
            print("컴퓨터의 턴입니다")
            start()
            
        case .draw:
            print("\(turn.check)의 승리!")
        }
    }
}
