//
//  Menu.swift
//  RockPaperScissors
//
//  Created by 레옹아범, Rhode, Rowan on 2022/12/29.
//


enum Menu {
    case end
    case rock
    case scissors
    case paper
    
    static func get(_ number: Int, type: Rule) -> Menu? {
        if type == .rockPaperScissors {
            switch number {
            case 0:
                return .end
            case 1:
                return .scissors
            case 2:
                return .rock
            case 3:
                return .paper
            default:
                return nil
            }
        } else {
            switch number {
            case 0:
                return .end
            case 1:
                return .rock
            case 2:
                return .scissors
            case 3:
                return .paper
            default:
                return nil
            }
        }
    }
}
