//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let possibleInputRange = 1...3

func inputingUserNumber(range: ClosedRange<Int> = possibleInputRange) -> Int {
    guard let input = readLine(), input != "" else {
        fatalError("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    let convertedInput = input.compactMap { Int(String($0)) }
    guard convertedInput.count == input.count else {
        fatalError("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    guard let firstItem = convertedInput.first else {
        fatalError("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    guard convertedInput.count == 1 && range ~= firstItem else {
        fatalError("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    return firstItem
}
