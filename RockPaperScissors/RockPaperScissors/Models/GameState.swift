//
//  GameState.swift
//  Created by Wonbi, 미니
//

enum GameState {
	case win
	case lose
	case draw
	case error
	case exit

	var description: String {
		switch self {
		case .win:
			return GameMessage.win
			
		case .lose:
			return GameMessage.lose
			
		case .draw:
			return GameMessage.draw
			
		case .exit:
			return GameMessage.exit
			
		case .error:
			return GameMessage.error
		}
	}
}
