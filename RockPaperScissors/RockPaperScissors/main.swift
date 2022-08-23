//
//  RockPaperScissors - main.swift
//  Created by Baem, Dragon
//  Copyright © yagom academy. All rights reserved.
// 

func gameStart() -> Int? {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    let userInput = readLine()
    guard let userInput = userInput else { return nil }
    
    return Int(userInput)
}

