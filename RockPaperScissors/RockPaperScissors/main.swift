//
//  RockPaperScissors - main.swift
//  Created by Lingo, 우롱차.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func getUserInput() -> Int? {
    let userInput = readLine()
    
    guard let checkInput = userInput else { return nil }
    guard let userIntInput = Int(checkInput) else { return nil }
    if userIntInput >= 0 && userIntInput <= 3 {
        return userIntInput
    }
    return nil
}

