//
//  PlayerOptions.swift
//  RockPaperScissors
//
//  Created by mmim, Red on 2022/02/16.

//

import Foundation

enum PlayerOptions {
    case exit
    case scissor
    case rock
    case paper
    case error
}

extension PlayerOptions {
    var optionNumber: Int {
        switch self {
        case .exit:
            return 0
        case .scissor:
            return 1
        case .rock:
            return 2
        case .paper:
            return 3
        case .error:
            return 4
        }
    }
    var printMassage: String {
        switch self {
        case .exit:
            return "게임종료"
        case .error:
            return "잘못된 입력입니다. 다시 시도해 주세요."
        default:
            return ""
        }
    }
}
