//
//  GameJudgment.swift
//  RockPaperScissors
//
//  Created by Gundy, Bella
//

enum GameJudgment: String {
    case win
    case lose
    case draw
    
    var message: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        default:
            return "비겼습니다!"
        }
    }
    
}
