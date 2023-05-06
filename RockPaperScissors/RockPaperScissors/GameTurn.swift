//
//  GameTurn.swift
//  RockPaperScissors
//
//  Created by Minseong Kang on 2023/05/05.
//

enum GameTurn: String {
	case user
	case computer
    case gameEnd
    
    var description: String {
        switch self {
        case .user:
            return "사용자"
        case .computer:
            return "컴퓨터"
        case .gameEnd:
            return ""
        }
    }
}
