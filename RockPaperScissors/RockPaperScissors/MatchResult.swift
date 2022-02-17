//
//  MatchResult.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/17.
//

import Foundation

enum MatchResult {
    case win
    case lose
    case draw
    case computerTurn
    case playerTurn
}

extension MatchResult {
    var message: String {
        switch self {
        case .win:
            return "사용자의 승리!"
        case .lose:
            return "컴퓨터의 승리!"
        case .draw:
            return "비겼습니다!"
        case .computerTurn:
            return "[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
        case .playerTurn:
            return "[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
        }
    }
}
