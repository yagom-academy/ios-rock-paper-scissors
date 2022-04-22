//
//  GameType.swift
//  RockPaperScissors
//
//  Created by Derrick kim, ZZBAE on 2022/04/18.
//

import Foundation

enum RockPaperScissors: Int {
    case none
    case scissors
    case rock
    case paper
}

extension RockPaperScissors {
    var value: Int {
        switch self {
        case .none:
            return 0
        case .scissors:
            return 2
        case .rock:
            return 1
        case .paper:
            return 3
        }
    }
    
    func convert() -> MukjjipaType {
        return MukjjipaType(rawValue: self.value) ?? .none
    }
}
