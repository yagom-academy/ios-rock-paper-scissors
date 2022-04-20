//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 허건 on 2022/04/20.
//
enum RockPaperSciccorsCondition {
    case scissors
    case rock
    case paper
    case end
}

extension RockPaperSciccorsCondition {
    var choiceRockPaperScissors: String {
        switch self {
        case .scissors:
            return "1"
        case .rock:
            return "2"
        case .paper:
            return "3"
        case .end:
            return "0"
        }
    }
}
