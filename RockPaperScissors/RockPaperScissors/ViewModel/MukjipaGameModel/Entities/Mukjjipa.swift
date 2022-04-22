//
//  Mukjipa.swift
//  RockPaperScissors
//
//  Created by Derrick kim on 2022/04/22.
//

import Foundation

enum MukjjipaType: Int {
    case none = 0
    case rock = 1
    case scissors = 2
    case paper = 3
}

struct Mukjjipa {
    var order: Player?
    var userValue: MukjjipaType?
    var computerValue: MukjjipaType?
    
    init(order: Player? = .user, userValue: MukjjipaType? = MukjjipaType.none, computerValue: MukjjipaType? = MukjjipaType.none) {
        self.order = order
        self.userValue = userValue
        self.computerValue = computerValue
    }
}

extension MukjjipaType {
    var value: Int {
        switch self {
        case .none:
            return 0
        case .scissors:
            return 1
        case .rock:
            return 2
        case .paper:
            return 3
        }
    }
    
    func convert() -> RockPaperScissors {
        return RockPaperScissors(rawValue: self.value) ?? .none
    }
}
