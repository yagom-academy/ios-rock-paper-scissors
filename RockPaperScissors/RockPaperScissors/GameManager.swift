//
//  RockPaperScissors - GameManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct GameManager {
    var players: [Player]
    
    init(_ players: Player...) {
        self.players = players
    }
    
    func printRockPaperScissorsManual() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
}
