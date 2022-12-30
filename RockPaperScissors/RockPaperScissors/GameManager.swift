//
//  RockPaperScissors - GameManager.swift
//  Created by 혜모리, 무리 on 2022.12.29
//

class GameManager {
    let rockPaperScissorsGame: RockPaperScissors = RockPaperScissors()
    let mookJjiBbaGame: MookJjiBba = MookJjiBba()

    func startGame() {
        rockPaperScissorsGame.playRockPaperScissors(mookJjiBba: mookJjiBbaGame)
        
        mookJjiBbaGame.playMookJjiBba()
    }
}
