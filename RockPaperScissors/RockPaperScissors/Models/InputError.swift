//
//  InputError.swift
//  RockPaperScissors
//

enum InputError: Error {
	case invalidNumber
	case exitGame
	
	var description: String {
		switch self {
		case .invalidNumber:
			return "잘못된입력입니다. 다시 시도해주세요."
		case .exitGame:
			return "게임 종료"
		}
	}
}
