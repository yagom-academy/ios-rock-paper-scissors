//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors: Int {
    case scissor = 1
    case rock = 2
    case paper = 3
}


func compareRockPaperScissors(between randomRockPaperScissors: RockPaperScissors, and playerRockPaperScissors: RockPaperScissors) -> String {
    if randomRockPaperScissors == playerRockPaperScissors {
        return "비겼습니다!"
    }
    
    switch playerRockPaperScissors {
    case .scissor:
        return randomRockPaperScissors == RockPaperScissors.paper ? "이겼습니다!" : "졌습니다!"
    case .rock:
        return randomRockPaperScissors == RockPaperScissors.scissor ? "이겼습니다!" : "졌습니다!"
    case .paper:
        return randomRockPaperScissors == RockPaperScissors.rock ? "이겼습니다!" : "졌습니다!"
    }
}
