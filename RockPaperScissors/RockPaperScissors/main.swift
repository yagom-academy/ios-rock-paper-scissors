//
//  RockPaperScissors - main.swift
//  Created by Lingo, 우롱차.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func getUserInput() -> Int? {
    guard let userInput = readLine(), let userIntInput = Int(userInput) else { return nil }
    
    if userIntInput >= 0 && userIntInput <= 3 {
        return userIntInput
    }
    return nil
}

