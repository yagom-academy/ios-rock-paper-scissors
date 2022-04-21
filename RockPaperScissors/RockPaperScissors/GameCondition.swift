//
//  GameCondition.swift
//  RockPaperScissors
//
//  Created by dhoney96 on 2022/04/20.
//
enum RockPaperScissors {
    case rock
    case scissors
    case paper
    case end
}

extension RockPaperScissors {
    var theNumberOfCase: String {
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

enum Mukjjibba {
    case muk
    case jji
    case bba
    case end
}

extension Mukjjibba {
    var theNumberOfCase: String {
        switch self {
        case .muk:
            return "1"
        case .jji:
            return "2"
        case .bba:
            return "3"
        case .end:
            return "0"
        }
    }
}
