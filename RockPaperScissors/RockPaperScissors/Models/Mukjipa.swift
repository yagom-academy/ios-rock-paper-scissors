//
//  Mukjipa.swift
//  Created by Wonbi, 미니
//

enum Mukjipa: Int, CaseIterable {
    case none = 0
    case muk = 1
    case ji = 2
    case pa = 3
    
    private func generateComputerCard() -> Self {
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
