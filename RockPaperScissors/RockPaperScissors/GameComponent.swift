//
//  GameComponent.swift
//  RockPaperScissors
//
//  Created by Harry, Andrew on 2022/12/28.
//

enum GameFlow {
    case keepPlaying
    case gameOver
}

enum MatchResult {
    case win
    case same
    case lose
}

enum HandShape: CaseIterable {
    case rock
    case paper
    case scissors
}

enum MukJiPPaTurn {
    case user
    case computer
    case gameEnd
    
    func turnMessage() -> String {
        switch self {
        case .user:
            return "사용자의 턴입니다."
        case .computer:
            return "컴퓨터의 턴입니다."
        default:
            return ""
        }
    }
}
