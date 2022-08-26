//
//  RockPaperScissors - GameResult.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum RockPaperScissorsGameResult {
    case win, lose, draw
    
    var winner: String {
        switch self {
        case .win:
            return Player.user
        case .lose:
            return Player.computer
        case .draw:
            return ""
        }
    }
    
    func printMessage() {
        switch self {
        case .win:
            print(GameResultMessage.winning)
        case .lose:
            print(GameResultMessage.losing)
        case .draw:
            print(GameResultMessage.draw)
        }
    }
}

enum MukJjiBbaGameResult {
    case win
    case reMatch(RockPaperScissorsGameResult)
}
