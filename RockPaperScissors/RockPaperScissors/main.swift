//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum rockScissorPaper: Int,CaseIterable {
    case scissor = 1
    case rock = 2
    case paper = 3
}


func startGame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: " ")
    
    let input: String? = readLine()
    guard let inputValue = input, let inputNumber = Int(inputValue) else {
        return
    }
    
    switch inputNumber {
    case 1,2,3: compare(userInput: inputNumber)
    case 0 :
        print("게임을 종료합니다.")
        return
    default :
        print("잘못입력하셨습니다.")
    }
}

func compare(userInput: Int) {
    let computerInput = Int.random(in: 1...3)
    print(computerInput)
    
    if computerInput == userInput {
        print("비겼습니다!")
        startGame()
    }
    
    if (computerInput == 1 && userInput == 2) ||
       (computerInput == 2 && userInput == 3) ||
       computerInput == 3 && userInput == 1 {
        print("이겼습니다!")
    }
    
    if (computerInput == 1 && userInput == 3) ||
       (computerInput == 2 && userInput == 1) ||
       (computerInput == 3 && userInput == 2) {
        print("졌습니다!")
    }
    
}

startGame()
