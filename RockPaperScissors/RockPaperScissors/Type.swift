//
//  type.swift
//  RockPaperScissors
//
//  Created by 천승현 on 2022/12/28.
//

enum RockScissorsPaperError: Error {
    case invalidRockScissorsPaper
    case invalidMukjippa
}

enum RockScissorsPaperType: Int {
    case scissors = 1
    case rock
    case paper
}

enum RockScissorsPaperScenario {
    case userWin
    case userLose
    case draw
}

enum PreviousType: String {
    case user = "사용자"
    case computer = "컴퓨터"
}
