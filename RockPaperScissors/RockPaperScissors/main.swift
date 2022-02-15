//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct RockPaperScissorsGame {
    private enum RockPaperScissorsType: Int {
        case rock = 1
        case paper = 2
        case scissor = 3
        case exit = 0
        
        var value: Int {
            switch self {
            case .rock: return 1
            case .paper: return 2
            case .scissor: return 3
            case .exit: return 0
                
            }
        }
        
       private func printUserInterface() {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> :" , terminator: "")
        }
    }
}

