//
//  RockPaperScissors - main.swift
//  Created by Riji,Rilla.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockScissorPaper: String,CaseIterable {
    case scissor = "1"
    case rock = "2"
    case paper = "3"
}

enum RockScissorPaperGameError : Error {
    case invalidInput
}

func startGame() {
    
 
}

func printGameMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: " ")
}

func getUserInput() -> String? {
    let input: String? = readLine()
    return input
}

func checkAvailability(input: String?) -> Result<RockScissorPaper, RockScissorPaperGameError> {
    guard let userInput = input,
    let userHandMotion = RockScissorPaper(rawValue: userInput)
    else {
        return .failure(.invalidInput)
    }
    return .success(userHandMotion)
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
