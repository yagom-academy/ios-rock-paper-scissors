//
//  RockPaperScissors - main.swift
//  Created by Riji,Rilla.
//  Copyright © yagom academy. All rights reserved.
// 



enum GameMenu: String {
    case scissor = "1"
    case rock = "2"
    case paper = "3"
    case endGame = "0"
}

enum GameResult {
    case win, draw, lose
}

enum GameError : Error {
    case invalidInput
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

func checkAvailability(input: String?) -> Result<GameMenu, GameError> {
    
    guard let userInput = input,
          let userHandMotion = GameMenu(rawValue: userInput)
    else { return .failure(.invalidInput) }
    return .success(userHandMotion)
}

func handleGameError(userInput: Result<GameMenu, GameError>) -> GameMenu? {
    switch userInput {
    case .failure(_):
        print("잘못된 입력입니다. 다시 시도해주세요")
        startGame()
        return nil
    case .success(let handMotion):
        if handMotion == .endGame {
            print("게임종료")
            return nil
        }
        return handMotion
    }
}

func makeRandomHandMotion() -> GameMenu? {
    guard let computerRandomNumber = ["1", "2", "3"].randomElement() else { return nil }
    let computerHandMotion = GameMenu(rawValue: computerRandomNumber)
    return computerHandMotion
}

func compare(_ userInput: GameMenu?, with computerInput: GameMenu?) {
    guard let user = userInput, let computer = computerInput else { return }
    
    switch (user, computer) {
    case (.scissor, .paper), (.rock, .scissor), (.paper, .rock) :
        printRockScissorPaperGameResult(gameResult: .win)
        isUserWin = true
    case (.scissor, .rock), (.rock, .paper), (.paper, .scissor) :
        printRockScissorPaperGameResult(gameResult: .lose)
        isUserWin = false
    default : printRockScissorPaperGameResult(gameResult: .draw)
    }
}

func printRockScissorPaperGameResult(gameResult: GameResult) {
    switch gameResult {
    case .win
        print("이겼습니다!")
    case .lose:
        print("졌습니다!")
    case .draw:
        print("비겼습니다!")
        startGame()
    }
}

startGame()
