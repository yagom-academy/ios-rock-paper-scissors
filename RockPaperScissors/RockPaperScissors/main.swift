//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors: Int, CaseIterable {
    case scissor = 1
    case rock = 2
    case paper = 3
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
    
    func generateComputerNumber() -> RockPaperScissors? {
        guard let randomData = RockPaperScissors.allCases.randomElement() else {
            return nil
        }
        
        return randomData
    }
    
    func inputUserNumber() -> RockPaperScissors? {
        guard let inputNumber = readLine() else {
            return nil
        }
        
        guard let convertedInt = Int(inputNumber) else {
            return nil
        }
        
        guard let RockPaperScissorsData = RockPaperScissors(rawValue: convertedInt) else {
            return nil
        }
        
        return RockPaperScissorsData
    }
    
    func startGame() {
        var flag = true
        
        while flag {
            print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
            
            guard let computerNumber = generateComputerNumber() else {
                continue
            }
            
            guard let userNumber = inputUserNumber() else {
                continue
            }
        }
    }
    
}
