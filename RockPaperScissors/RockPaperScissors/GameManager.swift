//
//  RockPaperScissors - GameManager.swift
//  Created by 혜모리, 무리 on 2022.12.29
//

class GameManager {
    var turnOwner: Player?
    let rockPaperScissorsGame: RockPaperScissors = RockPaperScissors()
    let mookJjiBbaGame: MookJjiBba = MookJjiBba()
    
    func excuteMookJjiBbaGame(player: Player) {
        turnOwner = player
        
        guard let crrentTurnOwner = turnOwner else {
            return startGame()
        }
        
        mookJjiBbaGame.playMookJjiBba(turnOwner: crrentTurnOwner)
    }
    
    func startGame() {
        let rockPaperScissorsGameStatus = rockPaperScissorsGame.playRockPaperScissors()
        
        guard rockPaperScissorsGameStatus != .stop else {
            return
        }
        
        guard let rockPaperScissorsGameResult = rockPaperScissorsGame.gameResult else {
            return startGame()
        }
        
        if rockPaperScissorsGameResult == .draw {
            print("비겼습니다!")
            startGame()
        } else if rockPaperScissorsGameResult == .win {
            print("이겼습니다!")
            excuteMookJjiBbaGame(player: .user)
        } else if rockPaperScissorsGameResult == .lose {
            print("졌습니다")
            excuteMookJjiBbaGame(player: .computer)
        }
    }
}
