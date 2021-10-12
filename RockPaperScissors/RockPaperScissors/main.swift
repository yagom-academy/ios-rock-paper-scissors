//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

func printGameStart() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ")
    guard let userInput = readLine(), let userInputNumber = Int(userInput) else {
        return
    }
    if userInputNumber == 0 {
        return
    }
}

