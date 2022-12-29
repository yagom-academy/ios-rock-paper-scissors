//
//  Menu.swift
//  RockPaperScissors
//
//  Created by 강민수 on 2022/12/29.
//

enum Menu {
    case end
    case rock
    case scissors
    case paper
    
    init?(rockPaperScissors: Int) {
        switch rockPaperScissors {
        case 0:
            self = .end
        case 1:
            self = .scissors
        case 2:
            self = .rock
        case 3:
            self = .paper
        default:
            return nil
        }
    }
    
    init?(mookZziPpa: Int) {
        switch mookZziPpa {
        case 0:
            self = .end
        case 1:
            self = .rock
        case 2:
            self = .scissors
        case 3:
            self = .paper
        default:
            return nil
        }
    }
}
