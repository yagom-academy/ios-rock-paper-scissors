//
//  RockPaperScissors - main.swift
//  Created by Harry, Andrew. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료: 0>", terminator: ": ")
}

func readUserInput() -> Result<String, InputError> {
    guard let userInput = readLine() else {
        return .failure(.invalidInput)
    }
    guard userInput != "" else {
        return .failure(.invalidInput)
    }
    
    return .success(userInput)
}

func validationUserInput() throws -> Result<Int, InputError> {
    guard let result = try? readUserInput().get() else {
        return .failure(.invalidInput)
    }
    guard let number = Int(result) else {
        return .failure(.invalidInput)
    }
    guard number >= 0, number <= 3 else {
        return .failure(.invalidInput)
    }
        
    return .success(number)
}
