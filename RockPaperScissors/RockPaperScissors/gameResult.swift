//
//  WinLoseDraw.swift
//  RockPaperScissors
//
//  Created by LJ, 준호 on 2022/08/23.
//

enum gameResult {
    case win
    case lose
    case draw
    
    var result: String {
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
