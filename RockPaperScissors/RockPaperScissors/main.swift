//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

fileprivate enum Message {
    static let end = "게임 종료"
    static let invaild = "잘못된 입력입니다. 다시 시도해주세요."
}

fileprivate enum GameError: Error, CustomStringConvertible {
    case emptyCollection
    
    var description: String {
        switch self {
        case .emptyCollection:
            return "열거형이 비어있어요"
        }
    }
}
