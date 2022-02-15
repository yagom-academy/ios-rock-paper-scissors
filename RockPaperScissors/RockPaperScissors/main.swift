//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors {
    case rock
    case paper
    case scissor
}

enum Result {
    case win
    case lose
    case draw
}

enum ErrorCase: Error {
    case inputError
}

class RockPaperScissorsGame {
    let computerNumber = Int.random(in: 1..<4)
    
    func inputUserNumber() -> Int {
        guard let inputNumber = readLine() else {
            return 4
        }
        
        guard let convertedInt = Int(inputNumber) else {
            return 4
        }
        
        return convertedInt
    }
}
