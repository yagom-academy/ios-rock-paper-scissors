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
		let inputUserMenu = inputUserNumber()
		
		if inputUserMenu == 0 { break }
		
		let selectInputUserNumber = inputUserMenu-1
		let selectRandomNumber = generateRandomNumber()-1
		
		let handShape = HandShape.allCases[selectInputUserNumber]
		let randomHandShape = HandShape.allCases[selectRandomNumber]
		
		switch competeResult(user: handShape, computer: randomHandShape){
		case .draw:
			print("비겼습니다!")
		case .lose:
			print("졌습니다!")
			isRunningStart = false
		case .win:
			print("이겼습니다!")
			isRunningStart = false
		}
	}
	print("게임 종료")
}

func inputUserNumber() -> Int {
	var outputNumber = 0
	var isNotCorrectNumber = true

	while isNotCorrectNumber {
		print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")

		if let inputString = readLine(), let convertInteger = Int(inputString) {
			outputNumber = convertInteger
		} else {
			print("잘못된 입력입니다. 다시 시도해주세요.")
			continue
		}

		if (0...3).contains(outputNumber) {
			isNotCorrectNumber = false
		} else {
			print("잘못된 입력입니다. 다시 시도해주세요.")
		}
	}

	return outputNumber
}

func generateRandomNumber() -> Int {
	return Int.random(in: 1...3)
}

func competeResult(user: HandShape, computer: HandShape) -> GameResult {
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
