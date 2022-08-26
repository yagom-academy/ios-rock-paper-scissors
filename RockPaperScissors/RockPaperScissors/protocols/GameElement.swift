//
//  GameElement.swift
//  Created by Wonbi, 미니
//

protocol GameElement {
    associatedtype Element
    
    func chooseComputerNumber(between min: Int, and max: Int) -> Int
    func generateComputerCard() -> Element
    func generateGameResult() -> GameState
    func compare(to computerCard: Element) -> GameState
}
