//
//  Result.swift
//  RockPaperScissors
//
//  Created by kiwi,bard on 2022/04/19.
//

enum GameResult {
    case win
    case lose
    case draw
}

extension GameResult {
    var message: String {
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
