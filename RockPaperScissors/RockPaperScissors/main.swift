//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors: CaseIterable {
	case scissors, rock, paper
	
	func winsAgainst() -> RockPaperScissors {
		switch self {
		case .scissors:
			return .paper
		case .rock:
			return .scissors
		case .paper:
			return .rock
		}
	}
}

func receiveUserInput() -> Int {
	
	guard let validInput = readLine() else {
		return -1
	}
	
	guard let validConvertedInput = Int(validInput) else {
		return -1
	}
	
	return validConvertedInput
}

while true {
	
	print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
	
	let userDecision = receiveUserInput()
	
	if userDecision == 0 {
		print("게임 종료")
		break
	}
	
	var userHand: RockPaperScissors
	
	switch userDecision {
	case 1:
		userHand = .scissors
	case 2:
		userHand = .rock
	case 3:
		userHand = .paper
	default:
		print("잘못된 입력입니다. 다시 시도해주세요.")
		continue
	}
	
	let computerHand = RockPaperScissors.allCases.randomElement()
	
	switch computerHand {
	case userHand:
		print("비겼습니다!")
	case userHand.winsAgainst():
		print("이겼습니다!")
	default:
		print("졌습니다!")
	}
}

