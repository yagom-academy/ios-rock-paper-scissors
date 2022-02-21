//
//  game.swift
//  RockPaperScissors
//
//  Created by 박세웅 on 2022/02/17.
//

import Foundation

class Game {
    var user: Player
    var computer: Player
    
    init(user: Player, computer: Player){
        self.user = user
        self.computer = computer
    }
    
    func playGame() { }
    
    func inputCard() -> Card? {
        guard let userCard: String = readLine() else { return nil }
        return Card(rawValue: userCard)
    }
    
    func makeRandomCard() -> Card {
        let randomCard: Card = .cases[Int.random(in: 1..<Card.cases.count)]
        return randomCard
    }
    
    func printMenu() { }
    
    func openCard(selectedCard: Card) {
        computer.setCard(selectedCard: makeRandomCard())
        user.setCard(selectedCard: selectedCard)
        
        guard let userCard: Card = user.getCard() else { return }
        guard let computerCard: Card = computer.getCard() else { return }
        
        compareCard(userCard: userCard, computerCard: computerCard)
    }
    
    func compareCard(userCard: Card, computerCard: Card) { }
    
    func printResult(gameResult: Result) { }
}
