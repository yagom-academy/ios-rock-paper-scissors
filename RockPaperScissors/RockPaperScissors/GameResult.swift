//
//  RockPaperScissors - GameResult.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum RockPaperScissorsGameResult {
    case win, lose, draw
}

enum MukJjiBbaGameResult {
    case win
    case reMatch(RockPaperScissorsGameResult)
}
