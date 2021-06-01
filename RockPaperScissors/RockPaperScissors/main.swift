//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var userScissorsRockPaper: Int = 0

let cissors = 1, rock = 2, paper = 3
let cissorsRockPaper: Array<Int> = [cissors,rock,paper]

// 입력 후 바인딩
func bindingUserInput() -> Int {
    while true {
        print("가위(1),바위(2),보(3)!<종료 : 0>", terminator: " : ")
        let userInput: String? = readLine()
        if let unWrappedUserInput: String = userInput, let userInputNum: Int = Int(unWrappedUserInput) {
            return userInputNum
        }
    }
}
