//
//  HandGame.swift
//  RockPaperScissors
//
//  Created by Minsup, Whales on 2023/05/04.
//

enum GameResult: Equatable {
    case end, again, next(Turn)
}

enum Turn: String {
    case user = "사용자", computer = "컴퓨터", none
}

enum HandShape: Int, CaseIterable {
    case scissors = 1, rock, paper
}

class HandShapeGamePreparation {    
    func printMenu(text: String) {
        print(text, terminator: " ")
    }
    
    func generateComputerHandShape() -> HandShape? {
        return HandShape.allCases.randomElement()
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
