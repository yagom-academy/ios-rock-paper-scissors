//
//  participant.swift
//  RockPaperScissors
//
//  Created by LJ, 준호.
//

enum Participant {
    case user
    case computer
    
    var name: String {
        switch self {
        case .user:
            return "사용자"
        case .computer:
            return "컴퓨터"
        }
    }
}
