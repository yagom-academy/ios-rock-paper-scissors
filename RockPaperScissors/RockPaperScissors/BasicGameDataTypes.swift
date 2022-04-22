//
//  BasicGameDataTypes.swift
//  Created by BaekGom, Finnn
//  Copyright © yagom academy. All rights reserved.
//

enum RockPaperScissors: Int {
    case rock = 1
    case paper
    case scissors
    case wrong
}

enum Mukchiba: Int {
    case muk = 1
    case chi
    case ba
    case wrong
}

enum RockPaperScissorsResult {
    case win
    case lose
    case tie
    case none
}

enum GameTurn {
    case user
    case computer
    
    var gameTurnType: String {
        switch self {
        case .user:
            return "사용자"
        case .computer:
            return "컴퓨터"
        }
    }
}
