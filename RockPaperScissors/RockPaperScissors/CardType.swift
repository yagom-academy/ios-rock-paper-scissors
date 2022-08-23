//
//  RockScisserPaper.swift
//  RockPaperScissors
//
//  Created by Wonbi on 2022/08/23.
//

import Foundation

enum CardType: Int {
    case scisser = 1
    case rock = 2
    case paper = 3
    
    func compare(to computerCard: CardType) -> GameState {
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
}
