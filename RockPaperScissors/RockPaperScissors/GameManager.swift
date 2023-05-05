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
        (turn, matchResult) = rockPaperScissorsGame.playRockPaperScissors()
        
        guard let owner = turn, let result = matchResult, result != .giveUp
        else {
            print("게임 종료")
            return
        }
        
        print("\(result.koreanMessage)")
        mukJjiPpaGame = MukJjiPpaGame(turn: owner, matchResult: result)
        
        guard let player = mukJjiPpaGame?.playMukJjiPpa(), player.status != .giveUp
        else {
            print("게임 종료")
            return
        }
        
        print("\(player.winner.koreanMessage)의 승리!")
    }
}
