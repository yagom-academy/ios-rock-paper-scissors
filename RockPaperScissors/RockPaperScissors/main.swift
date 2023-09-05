//
//  RockPaperScissors - main.swift
//  Created by Kiseok, Morgan.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

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

struct RockScissorsPaperGame {
    func readUserInput() throws {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
        
        guard let userInput = readLine() else {
            throw InputError.wrongInput
        }
        guard let user = Int(userInput) else {
            throw InputError.wrongInput
        }
        
        guard 0...3 ~= user else {
            throw InputError.wrongInput
        }
    }
}
