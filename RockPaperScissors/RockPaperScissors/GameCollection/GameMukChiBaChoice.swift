//
//  GameMukchibaChoice.swift
//  RockPaperScissors
//
//  Created by 그루트, 예톤 on 2022/04/21.
//

enum GameMukChiBaChoice: Int {
    case end = 0
    case muk = 1
    case chi = 2
    case ba = 3
    
    var number: Int {
        get {
            return self.rawValue
        }
    }
}
