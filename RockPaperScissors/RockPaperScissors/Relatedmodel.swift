//
//  model.swift
//  RockPaperScissors
//
//  Created by 김동욱 on 2022/02/16.
//

enum RockPaperScissors: Int, CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum GameResult: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
    
    var message: String {
        return self.rawValue
    }
    
    
}

enum Turn: String {
    case user = "사용자"
    case computer = "컴퓨터"
    
    var message: String {
        return self.rawValue
    }
}
