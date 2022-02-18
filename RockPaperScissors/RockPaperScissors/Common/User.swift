//
//  User.swift
//  RockPaperScissors
//
//  Created by 조민호 on 2022/02/15.
//

import Foundation

struct User {
    func selectedMenu() -> Int {
        guard let userInput: String = readLine(),
              let convertedUserInput: Int = Int(userInput) else {
                  return GameOption.wrongInput
              }
        
        guard verifyUserInput(userInput: convertedUserInput) else {
            return GameOption.wrongInput
        }
        
        return convertedUserInput
    }
    
    private func verifyUserInput(userInput: Int) -> Bool {
        let verifiedNumberRange: ClosedRange<Int> = GameOption.userNumberRange
        
        if verifiedNumberRange.contains(userInput) == false {
            return false
        }
        
        return true
    }
}

