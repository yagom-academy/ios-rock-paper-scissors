//
//  RPS.swift
//  Created by Wonbi, 미니
//

enum RPS: Int, CaseIterable, GameElement {
	case none = 0
	case scisser = 1
	case rock = 2
	case paper = 3
    
	func generateComputerCard() -> Self {
		let computerCard = Self.allCases[Int.random(in: 1...3)]
		return computerCard
	}
  
	func generateGameResult() -> GameState {
		let computerCard = generateComputerCard()
		return self.compare(to: computerCard)
	}
  
	func compare(to computerCard: Self) -> GameState {
		guard self != .none else { return .exit }
		let userNumber = self.rawValue
		let computerNumber = computerCard.rawValue
		let comparedResultNumber = userNumber - computerNumber

		switch comparedResultNumber {
		case -2, 1:
			return .userWin
		case -1, 2:
			return .computerWin
		default:
			return .draw
		}
	}
}
