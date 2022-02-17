//
//  Int.swift
//  RockPaperScissors
//
//  Created by 조민호 on 2022/02/17.
//

import Foundation

extension Int {
    func convertedIntToRockPaperScissorsType() -> RockPaperScissorsType {
        switch self {
        case RockPaperScissorsType.scissor.rawValue:
            return .scissor
        case RockPaperScissorsType.rock.rawValue:
            return .rock
        case RockPaperScissorsType.paper.rawValue:
            return .paper
        case RockPaperScissorsType.exit.rawValue:
            return .exit
        default:
            return .error
        }
    }
    
    func convertedIntToMukjipaType() -> MukjipaType {
        switch self {
        case MukjipaType.muk.rawValue:
            return .muk
        case MukjipaType.ji.rawValue:
            return .ji
        case MukjipaType.pa.rawValue:
            return .pa
        case MukjipaType.exit.rawValue:
            return .exit
        default:
            return .error
        }
    }

}
