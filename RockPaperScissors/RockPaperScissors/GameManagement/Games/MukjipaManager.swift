//
//  MukjipaGameManager.swift
//  Created by Wonbi, 미니
//

struct MukjipaManager: Gameable {
    typealias GameType = Mukjipa
    
    private var isUserTurn: Bool = true
    private var currentTurn: String {
        isUserTurn ? "사용자" : "컴퓨터"
    }
    
    func fetchUserInput() -> Int? {
        print("[\(currentTurn) 턴]", GameMessage.mukjipa, separator: " ", terminator: " : ")
        
        guard let inputValue = readLine(),
              let inputNumber = Int(inputValue),
              0...3 ~= inputNumber
        else {
            return nil
        }
        return inputNumber
    }
    
    func convertUserInput(number: Int?) -> Result<Mukjipa, InputError> {
        guard let number = number,
              let inputCard = Mukjipa(rawValue: number)
        else {
            return .failure(.invalidNumber)
        }
        return .success(inputCard)
    }
    
    func checkValidity(of userInputResult: Result<Mukjipa, InputError>) -> GameState {
        switch userInputResult {
        case .success(let inputCard):
            return inputCard.generateGameResult()
        case .failure:
            return .error
        }
    }
    
    private mutating func decideTurn(from result: GameState) {
        if result == .userWin {
            isUserTurn = true
        } else {
            isUserTurn = false
        }
    }
    
    private mutating func printTurn(to result: GameState) {
        if result == .userWin || result == .computerWin {
            decideTurn(from: result)
            print(currentTurn + "의 턴입니다.")
        }
    }
    
    private mutating func printWinner(from result: GameState) {
        if result == .draw {
            print(currentTurn + "의 승리!")
        }
    }
    
    mutating func startGame(from result: GameState) -> GameState {
        decideTurn(from: result)
        let userNumber = fetchUserInput()
        let userCard = convertUserInput(number: userNumber)
        let result = checkValidity(of: userCard)
        
        printTurn(to: result)
        printWinner(from: result)
        
        return result
    }
}
