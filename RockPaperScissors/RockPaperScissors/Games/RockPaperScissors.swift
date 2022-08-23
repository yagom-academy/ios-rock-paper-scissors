//
//  RockPaperScissors.swift
//  Created by Wonbi, 미니 on 2022/08/23.
//

class RockPaperScissors: GameAble {
	func startGame() {
		let userCard = fetchUserInput()
		checkValidable(of: userCard)
	}
	
	private func generateComputerCard() -> CardType {
		let randomNumber = Int.random(in: 1...3)
		guard let computerCard = CardType(rawValue: randomNumber) else { return .none }
		
		return computerCard
	}

	private func fetchUserInput() -> Result<CardType, InputError> {
		print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
		
		guard let inputedValue = readLine(),
			  let inputedNumber = Int(inputedValue),
			  0...3 ~= inputedNumber else { return .failure(.invalidNumber) }
		
		if inputedNumber == 0 {
			return .failure(.exitGame)
		} else if let inputedCard = CardType(rawValue: inputedNumber) {
			return .success(inputedCard)
		} else {
			return .failure(.invalidNumber)
		}
	}

	private func checkValidable(of userInputedResult: Result<CardType, InputError>) {
		switch userInputedResult {
		case .success(let inputedCard):
			checkGameResult(userCard: inputedCard)
		case .failure(let error):
			handleInputError(error)
		}
	}

	private func handleInputError(_ error: InputError) {
		print(error.description)
		if error == .invalidNumber {
			startGame()
		}
	}

	private func checkGameResult(userCard: CardType) {
		let computerCard = generateComputerCard()
		
		let result = userCard.compare(to: computerCard)
		
		print(result.description)
		if result == .draw {
			startGame()
		}
	}
}
