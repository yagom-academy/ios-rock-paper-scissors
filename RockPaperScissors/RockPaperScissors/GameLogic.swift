//
//  GameLogic.swift
//  RockPaperScissors
//
//  Created by Minseong Kang on 2023/05/05.
//

class GameLogic {
	typealias inputNumberGameTurn = (inputNumber: Int, gameTurn: GameTurn)
	func checkGameEnd(with userInput: Int) -> Bool {
		guard userInput == 0 else { return true }
		print("게임종료")
		return false
	}
	
	func generateRandomHandShape() -> HandShape? {
		return HandShape.allCases.randomElement()
	}
	
	func receiveHandShapeElement(index: Int) -> HandShape {
		return HandShape.allCases[index - 1]
	}
	
	func receiveGameResult(user: HandShape, computer: HandShape) -> GameResult {
		switch (user, computer) {
		case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
			return .draw
		case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
			return .lose
		case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
			return .win
		}
	}
	
	func determinGameTurn(with gameResult: GameResult) -> GameTurn {
		switch gameResult {
		case .draw:
			return .gameEnd
		case .lose:
			return .computer
		case .win:
			return .user
		}
	}
}
