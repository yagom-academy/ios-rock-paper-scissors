//
//  GameState.swift
//  Created by Wonbi, 미니
//

enum GameState {
    case win
    case lose
    case draw
    case error
    case exit

    var description: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        case .exit:
            return "게임 종료"
        case .error:
            return "잘못된입력입니다. 다시 시도해주세요."
        }
    }
}
