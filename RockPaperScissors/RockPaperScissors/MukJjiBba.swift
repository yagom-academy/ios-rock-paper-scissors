//
//  MukJjiBba.swift
//  RockPaperScissors
//
//  Created by Minseong Kang on 2023/05/05.
//

class MukJjiBba: RockScissorsPaper {
	func playMukJjiBba() {
		var gameTurn = playRockScissorsPaper()
		
		while gameTurn != .gameEnd {
			let gameData: inputNumberGameTurn = inputNumberAtMukJiBba(with: gameTurn)
			
			guard checkGameEnd(with: gameData.inputNumber) else { return }
			
			let handShape = receiveMukJjiBbaElement(index: gameData.inputNumber)
			guard let randomHandShape = generateRandomHandShape() else { continue }
			
			let gameResult = receiveGameResult(user: handShape, computer: randomHandShape)
			
			gameTurn = determinGameTurn(with: gameResult)
			
			determinVictory(with: gameTurn, and: gameData)
		}
	}
	
	func inputNumberAtMukJiBba(with turn: GameTurn) -> inputNumberGameTurn {
		let isNotCorrectNumber = true
		var gameTurn = turn
		
		while isNotCorrectNumber {
			print("[\(gameTurn.description) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
			
			guard let userInput = readLine(),
				  let covertUserInput = Int(userInput),
				  (0...3).contains(covertUserInput) else {
				print("잘못된 입력입니다. 다시 시도해주세요.")
				gameTurn = .computer
				continue
			}
			return (covertUserInput, gameTurn)
		}
	}
	
	func determinVictory(with gameTurn: GameTurn, and gameData: (inputNumber: Int, gameTurn: GameTurn)) {
		guard gameTurn == .gameEnd else {
			print("\(gameTurn.description)의 턴입니다.")
			return
		}
		print("\(gameData.gameTurn.description)의 승리!")
	}
	
	func receiveMukJjiBbaElement(index: Int) -> HandShape {
		let mukJjiBbaList: [HandShape] = [.rock, .scissors, .paper]
		return mukJjiBbaList[index - 1]
	}
}
