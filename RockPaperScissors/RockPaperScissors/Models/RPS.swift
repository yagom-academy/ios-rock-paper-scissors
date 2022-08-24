//
//  RPS.swift
//  Created by Wonbi, 미니
//

enum RPS: Int, CaseIterable {
	case scisser = 1
    case rock = 2
    case paper = 3
	
	private func generateComputerCard() -> RPS {
		let computerCard = Self.allCases[Int.random(in: 0...2)]
		return computerCard
	}
	
	func generateGameResult() -> GameState {
		let computerCard = generateComputerCard()
		return self.compare(to: computerCard)
	}
	
    func compare(to computerCard: RPS) -> GameState {
        let userNumber = self.rawValue
        let computerNumber = computerCard.rawValue
        let comparedResultNumber = userNumber - computerNumber
        
        switch comparedResultNumber {
        case -2, 1:
            return .win
        case -1, 2:
            return .lose
        default:
            return .draw
        }
    }
}

enum GameState {
    case win
    case lose
    case draw
	
	var description: String {
		switch self {
		case .win:
			return "이겼습니다!"
		case .lose:
			return "졌습니다!"
		case .draw:
			return "비겼습니다!"
		}
	}
}
