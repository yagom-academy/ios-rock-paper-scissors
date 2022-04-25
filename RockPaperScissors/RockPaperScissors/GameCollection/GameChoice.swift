//
//  Option.swift
//  RockPaperScissors
//
//  Created by 그루트, 예톤 on 2022/04/18.
//

enum GameChoice: Int {
    case end = 0
    case scissors = 1
    case rock = 2
    case paper = 3
    
    var number: Int {
        return self.rawValue
    }
    
    func changeMukChiBa() -> GameChoice {
        switch self {
        case .end:
            return .end
        case .scissors:
            return .rock
        case .rock:
            return .scissors
        case .paper:
            return .paper
        }
    }
}

