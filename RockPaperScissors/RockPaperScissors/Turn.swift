//
//  Turn.swift
//  RockPaperScissors
//
//  Created by kiwi,bard on 2022/04/20.
//

enum Turn {
    case computerTurn
    case userTurn
}

extension Turn {
    var turnResult: String {
        switch self {
        case .computerTurn:
            return "컴퓨터"
        case .userTurn:
            return "사용자"
        }
    }
}
