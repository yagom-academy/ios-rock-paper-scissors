//
//  RockPaperScissors - main.swift
//  Created by Riji,Rilla.
//  Copyright © yagom academy. All rights reserved.
// 

//import Foundation

enum RockScissorPaper: String,CaseIterable {
    case scissor = "1"
    case rock = "2"
    case paper = "3"
    case endGame = "0"
}

enum GameResult {
    case win, draw, lose
}

enum RockScissorPaperGameError : Error {
    case invalidInput
}

func startGame() {
    while true{
        printGameMenu()
        let userInput = checkAvailability(input: getUserInput())
        let userHandMotion = handleGameError(userInput: userInput)
        let computerHandMotion = makeRandomHandMotion()
        compare(userHandMotion, with: computerHandMotion)
    }
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

func handleGameError(userInput: Result<RockScissorPaper, RockScissorPaperGameError>) -> RockScissorPaper? {
    switch userInput {
    case .failure(_):
        print("잘못된 입력입니다. 다시 시도해주세요")
        return nil
    case .success(let handMotion):
        return handMotion
    }
}

func makeRandomHandMotion() -> RockScissorPaper? {
    let computerHandMotion = RockScissorPaper.allCases.randomElement()
    return computerHandMotion
}

func compare(_ userInput: RockScissorPaper?, with computerInput: RockScissorPaper?) {
    guard let user = userInput, let computer = computerInput else {
        return
    }
    
    switch (user, computer) {
    case (.scissor, .paper), (.rock, .scissor), (.paper, .rock) : print("")
    case (.scissor, .rock), (.rock, .paper), (.paper, .scissor) : print("")
    default : print("")
    }
    
    
}


startGame()
