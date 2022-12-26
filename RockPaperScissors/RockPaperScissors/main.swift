//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum InputError: Error {
    case invalidInput
}

func displayMenu() {
    let menuMessage = "가위(1), 바위(2), 보(3)! <종료: 0> :"
    print(menuMessage, terminator: "")
}

func readInput() -> Result<Int, InputError> {
    var result: Result<Int, InputError>
    
    guard let value = Int(readLine()) else {
        return result.failure(.invalidInput)
    }
    
    switch value {
    case 0...3:
        return result.success(value)
    default:
        return result.failure(.invalidInput)
    }
}

func generateRockScissorsPaper() -> Int {
    return Int.random(in: 1...3)
}

func decideWinner() -> String {
    
}
