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

 enum GameResult {
    case win
    case lose
    case draw
}
