//
//  PlayerOptions.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/17.
//

import Foundation

enum PlayerHands {
    case scissor
    case rock
    case paper
    case none
}

extension PlayerHands {
    var optionNumber: Int {
        switch self {
        case .scissor:
            return 1
        case .rock:
            return 2
        case .paper:
            return 3
        default:
            return Int.zero
        }
    }
}

enum Status {
    case begin
    case exit
    case error
    case inProgress
}

extension Status {
    var message: String {
        switch self {
        case .begin:
            return "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        case .exit:
            return "게임 종료"
        case .error:
            return "잘못된 입력입니다. 다시 시도해주세요."
        default:
            return "게임이 진행 중 입니다."
        }
    }
}
