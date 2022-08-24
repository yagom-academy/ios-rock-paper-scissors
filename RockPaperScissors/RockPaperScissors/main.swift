//
//  RockPaperScissors - main.swift
//  Created by Wonbi, 미니
//

struct GameManager {
	private let rpsGame = RPSGameManager()
	private var mukjipaGame = MukjipaGameManager()
	
	mutating func startConsole() {
		let result = rpsGame.startGame()
		
		print(result.description)
		
		switch result {
		case .draw:
			startConsole()
        case .error:
            startConsole()
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
			printResultOfMukjipaGame()
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
	
	mutating func printResultOfMukjipaGame() {
		print(mukjipaGame.attacker + "의 승리입니다.")
	}
}

var game = GameManager()
game.startConsole()

