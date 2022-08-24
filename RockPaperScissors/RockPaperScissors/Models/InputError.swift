//
//  InputError.swift
//  RockPaperScissors
//

enum InputError: Error {
	case invalidNumber
	
	var description: String {
		switch self {
		case .invalidNumber:
			return "잘못된 입력입니다. 다시 시도해주세요."
		}
	}
}
