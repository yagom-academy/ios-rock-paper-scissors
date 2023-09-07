//
//  enumType.swift
//  RockPaperScissors
//
//  Created by Kiseok, Morgan on 2023/09/05.
//

import Foundation

enum RockPaperScissors {
    case rock, paper, scissors, exit
}

enum Player {
    case user
    case computer
    case nobody
    
    var player: String {
        switch self {
        case .user:
            return "사용자"
        case .computer:
            return "컴퓨터"
        case .nobody:
            return "nobody"
        }
    }
}

enum gameResult {
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

enum InputError: Error {
    case wrongInput
    case nothingInputError
    case notNumberError
    case outOfRangeError
}

