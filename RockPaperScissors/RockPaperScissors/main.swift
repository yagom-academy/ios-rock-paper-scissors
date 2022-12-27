//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockScissorsPaperError: Error {
    case invalidRockScissorsPaper
    case invalidMukjippa
}

func printRockScissorsPaper() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: " ")
}

func choiceRockSissorsPaper() -> Result<Int, RockScissorsPaperError> {
    let input: String? = readLine()
    guard let choice = input else {
        return .failure(RockScissorsPaperError.invalidRockScissorsPaper)
    }
    
    guard let userChoice = Int(choice), (0...3) ~= userChoice else {
        return .failure(RockScissorsPaperError.invalidRockScissorsPaper)
    }
    return .success(userChoice)
}

