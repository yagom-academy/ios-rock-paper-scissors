//
//  RPSGameManager.swift
//  Created by Wonbi, 미니
//

struct RPSGameManager: Gameable {
	func fetchUserInput() -> Result<RPS, InputError> {
		print(GameMessage.rpsGame, terminator: " : ")

		guard let inputValue = readLine(),
			  let inputNumber = Int(inputValue),
			  0...3 ~= inputNumber
		else {
			return .failure(.invalidNumber)
		}

		if let inputCard = RPS(rawValue: inputNumber) {
			return .success(inputCard)
		} else {
			return .failure(.invalidNumber)
		}
	}

	func checkValidity(of userInputResult: Result<RPS, InputError>) -> GameState {
		switch userInputResult {
		case .success(let inputCard):
			return inputCard.generateGameResult()
		case .failure:
			return .error
		}
	}

	func startGame() -> GameState {
		let userCard = fetchUserInput()
		let result = checkValidity(of: userCard)

		return result
	}
}
