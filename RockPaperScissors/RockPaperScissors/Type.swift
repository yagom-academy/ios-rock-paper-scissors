//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 5조 on 2023/05/04.
//

enum RockPaperScissors: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

enum MukJiPpa: String {
    case muk = "1"
    case ji = "2"
    case ppa = "3"
}

enum Turn: String {
    case user = "사용자"
    case computer = "컴퓨터"
    case error = "게임 종료"
}

enum GameMode {
    case rockPaperScissors
    case mukJiPpa
}
