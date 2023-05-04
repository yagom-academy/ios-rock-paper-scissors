//
//  HandGame.swift
//  RockPaperScissors
//
//  Created by Minsup, Whales on 2023/05/04.
//

class HandShapeGamePreparation {
    func printMenu(text: String) {
        print(text, terminator: " ")
    }
    
    func generateComputerHandShape() -> HandShape? {
        return HandShape(rawValue: Int.random(in: 1...3))
    }
    
    func getMenuFromUser() -> Int? {
        guard let menu = readLine(), let menuNumber = Int(menu) else {
            return nil
        }
        return menuNumber
    }
    
    func convertHandShape(from shapeNumber: Int?) -> HandShape? {
        guard let shapeNumber = shapeNumber else { return nil }
        return HandShape(rawValue: shapeNumber)
    }
}
