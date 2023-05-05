//
//  RockScissorsPaper.swift
//  RockPaperScissors
//
//  Created by Minseong Kang on 2023/05/05.
//

func playRockScissorsPaper() -> GameTurns {
	var gameResult = GameResult.draw
	var gameTurn = GameTurns.gameEnd
	
	while gameResult == .draw {
		let userChoice = inputUserNumberAtRockScissorsPaper()
		
		if userChoice == 0 {
			print("게임 종료")
			return gameTurn
		}
		
		let handShape = receiveHandShapeElement(index: userChoice)
		guard let randomHandShape = generateRandomHandShape() else {
			continue
		}
		
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
			  let covertUserInput = Int(userInput) else {
			print("잘못된 입력입니다. 다시 시도해주세요.")
			continue
		}
		guard (0...3).contains(covertUserInput) else {
			print("잘못된 입력입니다. 다시 시도해주세요.")
			continue
		}
		return covertUserInput
	}
}

