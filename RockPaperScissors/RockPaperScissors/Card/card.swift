//
//  card.swift
//  RockPaperScissors
//
//  Created by 박세웅 on 2022/02/17.
//

import Foundation

enum GameMode {
    case 디폴트, 가위바위보, 묵찌빠
}

enum Card: String, CaseIterable {
    case terminator = "0"
    case scissors = "1"
    case rock = "2"
    case paper = "3"
    static let cases: [Card] = Card.allCases
    
    func compareEachCard(computerCard: Card, mode: GameMode) -> Result {
        let winCase = [[Card.scissors, Card.paper],[Card.rock, Card.scissors],[Card.paper, Card.rock]]
        let cardPair = [self, computerCard]
        if mode == .묵찌빠 && self == computerCard {
            return .victory
        } else if self == computerCard {
            return .draw
        } else if winCase.contains(cardPair) {
            return .win
        } else {
            return .lose
        }
    }
}
