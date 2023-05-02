//
//  Error.swift
//  RockPaperScissors
//
//  Created by maxhyunm, Mary on 2023/05/02.
//

enum GameError: Error {
    case menuNotFound
    case unknownError
    
    var errorMessage: String {
        switch self {
        case .menuNotFound:
            return "잘못된 입력입니다. 다시 시도해주세요."
        case .unknownError:
            return "알 수 없는 오류입니다."
        }
    }
}
