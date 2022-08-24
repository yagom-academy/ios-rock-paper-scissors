//
//  RockPaperScissors - main.swift
//  Created by Wonbi, 미니
//

struct GameManager {
	private let rpsGame = RPSGameManager()
	private var mukjipaGame = MukjipaGameManager()
	
	mutating func startRPS() {
		let result = rpsGame.startGame()
		
		print(result.description)
		
		switch result {
        case .draw, .error:
			startRPS()
        case .exit:
            return
		default:
			startMukjipa(result)
		}
	}
	
	mutating func startMukjipa(_ result: GameState) {
		let result = mukjipaGame.startGame(from: result)
		
		switch result {
		case .draw:
			return
		case .exit:
			print(result.description)
			return
		case .error:
			print(result.description)
			startMukjipa(result)
		default:
			startMukjipa(result)
		}
	}
}

var game = GameManager()
game.startRPS()

