//
//  MukChiBaGame.swift
//  RockPaperScissors
//
//  Created by LJ, 준호.
//

struct MukChiBaGame {
    func startGame() {
        let rockPaperScissorsGame: RockPaperScissorsGame = RockPaperScissorsGame()
        guard let turnOwner: Participant = rockPaperScissorsGame.startGame() else {
            return
        }
    }
    
    func printUserMenu(turnOwner: Participant) {
        print("[\(turnOwner.name) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    }
}
