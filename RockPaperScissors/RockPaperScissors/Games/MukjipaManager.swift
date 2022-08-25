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
	
    func fetchUserInput() -> Result<Mukjipa, InputError> {
		print("[\(currentTurn) 턴]", GameMessage.mukjipaGame, separator: " ", terminator: " : ")
		
        guard let inputValue = readLine(),
              let inputNumber = Int(inputValue),
              0...3 ~= inputNumber else { return .failure(.invalidNumber) }
        
        if let inputCard = Mukjipa(rawValue: inputNumber) {
            return .success(inputCard)
        } else {
            return .failure(.invalidNumber)
        }
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
		isUserTurn = (result == .userWin)
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
		let userCard = fetchUserInput()
		let result = checkValidity(of: userCard)
        
        printTurn(to: result)
        printWinner(from: result)
    
		return result
	}
}
