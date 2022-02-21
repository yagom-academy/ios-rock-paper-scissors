//
//  player.swift
//  RockPaperScissors
//
//  Created by 박세웅 on 2022/02/17.
//

import Foundation

struct Player {
    private let name: String
    private var card: Card?
    
    init(name: String) {
        self.name = name
    }
    
    public func getCard() -> Card? {
        return card
    }
    
    public func getName() -> String {
        return name
    }
    
    public mutating func setCard(selectedCard: Card) {
        card = selectedCard
    }
}
