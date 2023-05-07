//
//  Result.swift
//  RockPaperScissors
//
//  Created by 민다훈 on 2023/05/03.
//

enum Result {
    case win
    case lose
    case draw
    case giveUp
    
    var koreanMessage: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        case .giveUp:
            return "게임 종료"
        }
    }
}
