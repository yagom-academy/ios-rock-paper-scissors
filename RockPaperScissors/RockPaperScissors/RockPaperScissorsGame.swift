//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 김동욱 on 2022/02/16.
//

final class RockPaperScissorsGame: Game {
    
    override func printGameGuide() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
    }
    
    override func printGameResult(gameResult: GameResult) {
        
        print(gameResult.message)
        
        switch gameResult {
        case .win:
            let mukchiba = MukchibaGame(turn: .user)
            mukchiba.start()
        case .lose:
            let mukchiba = MukchibaGame(turn: .computer)
            mukchiba.start()
        case .draw:
            start()
        }
    }
}
