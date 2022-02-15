//
//  User.swift
//  RockPaperScissors
//
//  Created by 조민호 on 2022/02/15.
//

import Foundation

struct User {

    let anotherNumber: Int = 4
    
    func selectedMenu() -> Int {
        guard let userInput = readLine(),
            let convertedInput =  Int(userInput) else {
                return anotherNumber
        }
        return convertedInput
    }
}

