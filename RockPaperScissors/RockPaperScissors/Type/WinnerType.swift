//  RockPaperScissors - winnerType.swift
//  Created by vetto, songjun on 2022.12.28.

enum Winner {
    case user
    case computer
    case draw
    
    var name: String {
        switch self {
        case .user:
            return "사용자"
        case .computer:
            return "컴퓨터"
        case .draw:
            return "무승부"
        }
    }
}
