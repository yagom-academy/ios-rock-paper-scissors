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
    
    func getCard() -> Card? {
        return card
    }
    
    func getName() -> String {
        return name
    }
    
    mutating func setCard(selectedCard: Card) {
        card = selectedCard
    }
}
