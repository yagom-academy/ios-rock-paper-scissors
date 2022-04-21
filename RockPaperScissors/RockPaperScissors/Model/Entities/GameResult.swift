//
//  Result.swift
//  RockPaperScissors
//
//  Created by Derrick kim, ZZBAE on 2022/04/18.
//

import Foundation

enum GameResult {
    case win
    case lose
    case draw
}

extension GameResult {
    var value: String {
        switch self {
        case .win:
            return "이겼습니다.!"
        case .lose:
            return "졌습니다.!"
        case .draw:
            return "비겼습니다.!"
        }
    }
}
