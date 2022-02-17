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
}

extension MatchResult {
    var midtermMessage: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        }
    }
    var finalMessage: String {
        switch self {
        case .win:
            return "사용자의 승리!"
        case .lose:
            return "컴퓨터의 승리!"
        case .draw:
            return ""
        }
    }
}

enum Turn {
    case computerTurn
    case playerTurn
}

extension Turn {
    var inputMessage: String {
        switch self {
        case .computerTurn:
            return "[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
        case .playerTurn:
            return "[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
        }
    }
    var notificationMessage: String {
        switch self {
        case .computerTurn:
            return "컴퓨터의 턴입니다."
        case .playerTurn:
            return "사용자의 턴입니다."
        }
    }
}
