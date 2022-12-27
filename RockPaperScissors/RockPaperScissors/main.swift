//
//  RockPaperScissors - main.swift
//  Created by Harry, Andrew. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료: 0>", terminator: ": ")
}

func readUserInput() -> String? {
    guard let userInput = readLine() else {
        return nil
    }
    
    return userInput
}

func validationUserInput(userInput: String?) -> Result<Int, InputError> {
    guard let userInput = userInput else {
        return .failure(.invalidInput)
    }
    guard let number = Int(userInput) else {
        return .failure(.invalidInput)
    }
    guard number >= 0, number <= 3 else {
        return .failure(.invalidInput)
    }

    return .success(number)
}

let a = readUserInput()
let b = validationUserInput(userInput: a)
print(a)
print(b)

