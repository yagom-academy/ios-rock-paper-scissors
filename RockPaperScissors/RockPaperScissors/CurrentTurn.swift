//
//  CurrentTurn.swift
//  RockPaperScissors
//
//  Created by Lee minyeol on 2023/09/08.
//

enum CurrentTurn: CustomStringConvertible {
    case user
    case computer
    
    var description: String {
        switch self {
        case .user:
            return "사용자"
        case .computer:
            return "컴퓨터"
        }
    }
}
