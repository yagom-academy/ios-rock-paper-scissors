//
//  RockPaperScissors - GameMessage.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum GameResultMessage {
    static let winning = "이겼습니다!"
    static let losing = "졌습니다!"
    static let draw = "비겼습니다!"
}

enum ErrorMessage {
    static let invalidMenuNumber = "잘못된 입력입니다. 다시 시도해주세요."
}

enum ManualMessage {
    static let rockPaperScissorsManual = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    static let mukJjiBbaManual = "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
    static let ending = "게임 종료"
}

enum Player {
    static let computer = "컴퓨터"
    static let user = "사용자"
}
