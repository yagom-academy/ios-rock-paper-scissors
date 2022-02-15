//
//  User.swift
//  RockPaperScissors
//
//  Created by 조민호 on 2022/02/15.
//

import Foundation

struct User {
    enum UserOption {
        static let wrongInput: Int = 4
    }
    
    func selectedMenu() -> Int {
        guard let userInput = readLine(),
              let convertedUserInput =  Int(userInput) else {
                  return UserOption.wrongInput
              }
        return convertedUserInput
    }
}

