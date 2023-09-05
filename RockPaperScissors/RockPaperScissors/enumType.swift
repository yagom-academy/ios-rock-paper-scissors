//
//  enumType.swift
//  RockPaperScissors
//
//  Created by Kiseok, Morgan on 2023/09/05.
//

import Foundation

enum RockPaperScissors {
    case rock, paper, scissors, nothing
}

enum Result {
    case win, draw, lose, exit

    var result: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .lose:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        case .exit:
            return "게임종료"
        }
    }
}

enum InputError: LocalizedError {
    case wrongInput
    
    var errorDescription: String? {
        switch self {
        case .wrongInput:
            return "잘못된 입력입니다. 다시 시도해주세요."
        }
    }
}
