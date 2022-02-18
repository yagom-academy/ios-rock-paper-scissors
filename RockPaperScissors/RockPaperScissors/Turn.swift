//
//  Turn.swift
//  RockPaperScissors
//
//  Created by 김동욱 on 2022/02/18.
//

enum Turn: String {
    case user = "사용자"
    case computer = "컴퓨터"
    
    var message: String {
        return self.rawValue
    }
}
