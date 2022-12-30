//
//  RockPaperScissors - GameManager.swift
//  Created by 혜모리, 무리 on 2022.12.29
//

class GameManager {
    var turnOwner: Player?
    
    let rockPaperScissorsGame: RockPaperScissors = RockPaperScissors()
    let mookJjiBbaGame: MookJjiBba = MookJjiBba()

    func startGame() {
        rockPaperScissorsGame.playRockPaperScissors()
        mookJjiBbaGame.playMookJjiBba()
    }
}

/*
 if gameResult == .draw {
     print("비겼습니다!")
     playRockPaperScissors(mookJjiBba: mookJjiBba)
 } else if gameResult == .win {
     print("이겼습니다!")
     mookJjiBba.turnOwner = .user
 } else if gameResult == .lose {
     print("졌습니다")
     mookJjiBba.turnOwner = .computer
 */
