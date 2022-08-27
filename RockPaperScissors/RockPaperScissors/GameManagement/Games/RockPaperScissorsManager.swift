//
//  RPSGameManager.swift
//  Created by Wonbi, 미니
//

struct RockPaperScissorsManager: Gameable {
    typealias GameType = RockPaperScissors
    
    func fetchUserInput() -> Int? {
        print(GameMessage.rockPaperScissors, terminator: " : ")
        
        guard let inputValue = readLine(),
              let inputNumber = Int(inputValue),
              0...3 ~= inputNumber
        else {
            return nil
        }
        return inputNumber
    }
    
    func convertUserInput(number: Int?) -> Result<RockPaperScissors, InputError> {
        guard let number = number,
              let inputCard = RockPaperScissors(rawValue: number)
        else {
            return .failure(.invalidNumber)
        }
        return .success(inputCard)
    }

    func checkValidity(of userInputResult: Result<RockPaperScissors, InputError>) -> GameState {
        switch userInputResult {
        case .success(let inputCard):
            return inputCard.generateGameResult()
        case .failure:
            return .error
        }
    }
    
    func startGame() -> GameState {
        let userNumber = fetchUserInput()
        let userCard = convertUserInput(number: userNumber)
        let result = checkValidity(of: userCard)
        
        return result
    }
}
