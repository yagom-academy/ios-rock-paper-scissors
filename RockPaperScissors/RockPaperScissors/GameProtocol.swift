//
//  GameProtocol.swift
//  RockPaperScissors
//
//  Created by riji, rilla on 2022/12/28.
//

protocol GameProtocol {
    func printGameMenu()
    func handleGameError(userInput: Result<GameMenu, GameError>) -> GameMenu?
    func compare(_ userInput: GameMenu?, with computerInput: GameMenu?) -> GameResult?
    func printResult(gameResult: GameResult)
    func startGame()
}

extension GameProtocol {
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
    
    func makeRandomHandMotion() -> GameMenu? {
        guard let computerRandomNumber = ["1", "2", "3"].randomElement() else { return nil }
        let computerHandMotion = GameMenu(rawValue: computerRandomNumber)
        return computerHandMotion
    }
}

