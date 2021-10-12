//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printGameMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func generateRandomNumber() -> Int {
    let randomNumber = Int.random(in: 1...3)
    return randomNumber
}

func receiveUserInput() -> Int {
    var a = 0
    
    if let userInput = readLine() {
        if let integer = Int(userInput) {
            a = integer
        }
    }
    
    return a
}

