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
}

enum GameResult {
    case win, draw, lose
}

enum RockScissorPaperGameError : Error {
    case invalidInput
    case endGame
}

func startGame() {
    printGameMenu()
    let userInput = checkAvailability(input: getUserInput())
    let userHandMotion = handleGameError(userInput: userInput)
    let computerHandMotion = makeRandomHandMotion()
    compare(userHandMotion, with: computerHandMotion)
}

func printGameMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: " ")
}

func getUserInput() -> String? {
    let input: String? = readLine()
    return input
}

func checkAvailability(input: String?) -> Result<RockScissorPaper, RockScissorPaperGameError> {
    if input == "0" {
        return .failure(.endGame)
    }
    guard let userInput = input,
          let userHandMotion = RockScissorPaper(rawValue: userInput)
    else { return .failure(.invalidInput) }
    return .success(userHandMotion)
}

func handleGameError(userInput: Result<RockScissorPaper, RockScissorPaperGameError>) -> RockScissorPaper? {
    switch userInput {
    case .failure(let error):
        switch error {
        case.invalidInput:
            print("잘못된 입력입니다. 다시 시도해주세요")
            startGame()
        case .endGame:
            print("게임을 종료합니다.")
        }
        return nil
    case .success(let handMotion):
        return handMotion
    }
}

func makeRandomHandMotion() -> RockScissorPaper? {
    guard let computerRandomNumber = ["1", "2", "3"].randomElement() else { return nil }
    let computerHandMotion = RockScissorPaper(rawValue: computerRandomNumber)
    return computerHandMotion
}

func compare(_ userInput: RockScissorPaper?, with computerInput: RockScissorPaper?) {
    guard let user = userInput, let computer = computerInput else { return }
    
    switch (user, computer) {
    case (.scissor, .paper), (.rock, .scissor), (.paper, .rock) :
        printGameResult(gameResult: .win)
    case (.scissor, .rock), (.rock, .paper), (.paper, .scissor) :
        printGameResult(gameResult: .lose)
    default : printGameResult(gameResult: .draw)
    }
}

func printGameResult(gameResult: GameResult) {
    switch gameResult {
    case .win:
        print("이겼습니다!")
    case .lose:
        print("졌습니다!")
    case .draw:
        print("비겼습니다!")
        startGame()
    }
}

startGame()
