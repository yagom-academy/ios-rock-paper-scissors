//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 5조 on 2023/05/04.
//

enum RockPaperScissors: Int {
    case scissors = 1
    case rock
    case paper
}

enum MukJiPpa: Int {
    case muk = 1
    case ji
    case ppa
}

enum GameResult: String {
    case victory = "승리"
    case defeat = "패배"
    case gameOver = "게임 종료"
}
