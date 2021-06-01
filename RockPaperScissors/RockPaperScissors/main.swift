//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var userScissorsRockPaper: Int = 0

let scissors = 1, rock = 2, paper = 3
let scissorsRockPaper: Array<Int> = [scissors,rock,paper]

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

func makeComputerOutput() -> Int{
    let output = scissorsRockPaper[Int.random(in: 0...2)]
    return output
}
