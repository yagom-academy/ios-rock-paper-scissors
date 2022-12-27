//
//  RockPaperScissors - GameResult.swift
//  Created by 혜모리, 무리 on 2022.12.27
//

enum GameResult {
    case win
    case lose
    case draw
    
    var description: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        }
    }
}
