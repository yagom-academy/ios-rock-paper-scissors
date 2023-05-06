//
//  RockScissorsPaper.swift
//  RockPaperScissors
//
//  Created by Minseong Kang on 2023/05/05.
//
class RockScissorsPaper: GameLogic {
	func playRockScissorsPaper() -> GameTurn {
		var gameResult = GameResult.draw
		var gameTurn = GameTurn.gameEnd
		
		while gameResult == .draw {
			let userChoice = inputUserNumberAtRockScissorsPaper()
			
			guard let randomHandShape = generateRandomHandShape(),
				  checkGameEnd(with: userChoice) else { return gameTurn }
			
			let handShape = receiveHandShapeElement(index: userChoice)
			
			gameResult = receiveGameResult(user: handShape, computer: randomHandShape)
			
			showGameResult(with: gameResult)
			
			gameTurn = determinGameTurn(with: gameResult)
		}
		return gameTurn
	}
	
	func showGameResult(with gameResult: GameResult) {
		switch gameResult {
		case .draw:
			print("비겼습니다!")
		case .lose:
			print("졌습니다!")
		case .win:
			print("이겼습니다!")
		}
	}
	
	func inputUserNumberAtRockScissorsPaper() -> Int {
		let isNotCorrectNumber = true
		
		while isNotCorrectNumber {
			print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
			
			guard let userInput = readLine(),
				  let userInput = Int(userInput),
				  (0...3).contains(userInput) else {
				print("잘못된 입력입니다. 다시 시도해주세요.")
				continue
			}
			return userInput
		}
	}	
}
