//
//  GameController.swift
//  RockPaperScissors
//
//  Created by 이시원 on 2022/02/20.
//

import Foundation

struct GameController {
    private var user: Player = Player(name: "사용자")
    private var computer: Player = Player(name: "컴퓨터")

    func run() {
        
        let rockPaperScissorsGame: RockPaperScissors = RockPaperScissors(user: user, computer: computer)
        let mukChiBaGame: MukChiBa = MukChiBa(user: user, computer: computer)

        rockPaperScissorsGame.playGame()
        mukChiBaGame.setTurn(name: rockPaperScissorsGame.winner)
        mukChiBaGame.playGame()
    }
}
