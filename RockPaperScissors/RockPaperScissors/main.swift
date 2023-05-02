//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

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

func competeResult(userHandShape: HandShape, computerHandShape: HandShape) -> GameResult {
    switch (userHandShape, computerHandShape) {
    case (.scissors, .scissors):
        return .draw
    case (.scissors, .rock):
        return .lose
    case (.scissors, .paper):
        return .win
    case (.rock, .rock):
        return .draw
    case (.rock, .scissors):
        return .lose
    case (.rock, .paper):
        return .win
    case (.paper, .paper):
        return .draw
    case (.paper, .scissors):
        return .lose
    case (.paper, .rock):
        return .win
    }
}
