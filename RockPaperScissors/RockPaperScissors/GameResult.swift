//
//  GameResult.swift
//  RockPaperScissors
//
//  Created by 김동욱 on 2022/02/18.
//

enum GameResult: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
    
    var message: String {
        return self.rawValue
    }
}
