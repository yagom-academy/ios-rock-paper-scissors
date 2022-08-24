//
//  GameElement.swift
//  Created by Wonbi, 미니
//


protocol GameElement {
	associatedtype Element
	func generateComputerCard() -> Element
	func generateGameResult() -> GameState
	func compare(to computerCard: Element) -> GameState
}
