//
//  GameOver.swift
//  RockPaperScissors
//
//  Created by Gundy, Bella
//

enum GameOver {
    case userWin
    case computerWin
    case exit
    
    var message: String {
        switch self {
        case .userWin:
            return "사용자의 승리!"
        case .computerWin:
            return "컴퓨터의 승리!"
        default:
            return "게임 종료"
        }
    }
}
