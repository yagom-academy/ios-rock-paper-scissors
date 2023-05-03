//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

enum HandShape: CaseIterable {
	case scissors
	case rock
	case paper
}

enum GameResult {
	case win
	case draw
	case lose
}

func playRockScissorsPaper() {
	var isRunningStart = true

	while isRunningStart {
		let userMenu = inputUserNumber()
		
		if userMenu == 0 {
			break
		}
		
		let handShape = receiveHandShapeElement(index: userMenu)
		
		let gameResult = receiveGameResult(user: handShape, computer: generateRandomHandShape())
		
		isRunningStart = showGameResult(with: gameResult)
	}
	print("게임 종료")
}

func showGameResult(with gameResult: GameResult) -> Bool {
	var isDraw = true
	switch gameResult {
	case .draw:
		print("비겼습니다!")
	case .lose:
		print("졌습니다!")
		isDraw = false
	case .win:
		print("이겼습니다!")
		isDraw = false
	}
	return isDraw
}

func inputUserNumber() -> Int {
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

func generateRandomHandShape() -> HandShape {
	return HandShape.allCases[Int.random(in: 1...3) - 1]
}

func receiveHandShapeElement(index: Int) -> HandShape {
	return HandShape.allCases[index - 1]
}

func receiveGameResult(user: HandShape, computer: HandShape) -> GameResult {
	print(user,computer)
    switch (user, computer) {
    case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
        return .draw
    case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
        return .lose
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        return .win
    }
}

playRockScissorsPaper()
