//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct MukChiBaGame {
    var computerAnswer: Int = 0
    var userAnswer: Int = 0
    enum GameResult {
        case draw, win, lose
    }
    enum Hand: Int {
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    enum GameMessage: String {
        case menu = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        case exit = "게임 종료"
        case error = "잘못된 입력입니다. 다시 시도해주세요."
        case draw = "비겼습니다!"
        case win = "이겼습니다!"
        case lose = "졌습니다!"
    }
    func startGame() {
    }
}

MukChiBaGame().startGame()
