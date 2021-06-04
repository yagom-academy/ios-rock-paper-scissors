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

enum Player {
	case user
	case computer
	case unknown
	case noOne
	
	var name: String {
		if .user == self {
			return "사용자"
		} else {
			return "컴퓨터"
		}
	}
}

func receiveUserInput() -> Int {
	
	guard let validInput = readLine(), let validConvertedInput = Int(validInput) else {
		return -1
	}
	
	return validConvertedInput
}

var currentPlayer: Player = .unknown

while currentPlayer == .unknown {
	
	print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
	
	let userDecision = receiveUserInput()
	
	if userDecision == 0 {
		print("게임 종료")
		currentPlayer = .noOne
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
		currentPlayer = .user
	default:
		print("졌습니다!")
		currentPlayer = .computer
	}
}

var mookZziPpaWinner: Player = .unknown

while mookZziPpaWinner == .unknown && currentPlayer != .noOne  {
	print("[\(currentPlayer.name) 턴] 묵(1), 찌(2), 빠(3)!<종료 : 0> : ", terminator: "")
	let userDecision = receiveUserInput()
	
	if userDecision == 0 {
		print("게임 종료")
		break
	}
	
	var userHand: RockPaperScissors

	switch userDecision {
	case 1:
		userHand = .rock
	case 2:
		userHand = .scissors
	case 3:
		userHand = .paper
	default:
		print("잘못된 입력입니다. 다시 시도해주세요.")
		currentPlayer = .computer
		continue
	}
	
	let computerHand = RockPaperScissors.allCases.randomElement()

	switch computerHand {
	case userHand:
		print("\(currentPlayer.name)의 승리!")
		if currentPlayer == .user {
			mookZziPpaWinner = .user
		} else if currentPlayer == .computer {
			mookZziPpaWinner = .computer
		}
	case userHand.winsAgainst():
		currentPlayer = .user
		print("\(currentPlayer.name)의 턴입니다")
	default:
		currentPlayer = .computer
		print("\(currentPlayer.name)의 턴입니다")
	}
}
