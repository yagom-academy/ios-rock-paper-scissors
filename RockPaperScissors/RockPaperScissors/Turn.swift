//
//  Turn.swift
//  RockPaperScissors
//
//  Created by kiwi,bard on 2022/04/20.
//

enum Turn {
    case computer
    case user
}

extension Turn {
    var turnResult: String {
        switch self {
        case .computer:
            return "컴퓨터"
        case .user:
            return "사용자"
        }
    }
}
