//
//  Player.swift
//  RockPaperScissors
//
//  Created by 민다훈 on 2023/05/03.
//

enum Player {
    case user
    case computer
    
    var koreanMessage: String {
        switch self {
        case .user:
            return "사용자"
        case .computer:
            return "컴퓨터"
        }
    }
}
