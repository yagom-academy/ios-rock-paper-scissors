//
//  Model.swift
//  RockPaperScissors
//
//  Created by 잼킹 on 2021/03/02.
//

import Foundation

// 게임결과
enum Result: String {
    case win = "이겼습니다!"
    case draw = "비겼습니다!"
    case lose = "졌습니다ㅠㅠ"
}

// 가위 바위 보 또는 예외
enum ScissorsRockPaper: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
}
