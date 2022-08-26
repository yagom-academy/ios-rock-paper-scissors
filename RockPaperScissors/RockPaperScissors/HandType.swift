//
//  HandType.swift
//  RockPaperScissors
//
//  Created by jin on 8/23/22.
//

enum HandType {
    case scissor
    case rock
    case paper
    
    static func setRockScissorPaperHand(from handNumber: Int) -> HandType {
        switch handNumber {
        case 1:
            return .scissor
        case 2:
            return .rock
        default:
            return .paper
        }
    }
    static func setMukZiPpaHand(from handNumber: Int) -> HandType {
        switch handNumber {
        case 1:
            return .rock
        case 2:
            return .scissor
        default:
            return .paper
        }
    }
}
