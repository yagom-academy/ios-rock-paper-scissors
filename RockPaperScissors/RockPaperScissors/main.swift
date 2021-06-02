//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum RockPaperScissors: Int, CaseIterable {
	case scissors = 1, rock, paper
	
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

	var userDecision = receiveUserInput()
	
	if userDecision == 0 {
		print("게임 종료")
		break
	}
	
	while userDecision < 1 || userDecision > 3 {
		print("잘못된 입력입니다. 다시 시도해주세요.")
		userDecision = receiveUserInput()
	}
	
	let computerHand = RockPaperScissors.allCases.randomElement()

	let userHand = RockPaperScissors(rawValue: userDecision)
	
	
}

