//
//  gameMessage.swift
//  RockPaperScissors
//
//  Created by 이예은 on 2022/04/18.
//

import Foundation

enum GameMessage: String {
    case menuMessage = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case winningMessage = "이겼습니다!"
    case defeatMessage = "졌습니다!"
    case drowMessage = "비겼습니다!"
    case endingMessage = "게임 종료"
    case errorMessage = "잘못된 입력입니다. 다시 시도해주세요."
}


