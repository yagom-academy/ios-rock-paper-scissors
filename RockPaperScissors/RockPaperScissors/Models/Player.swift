//
//  Player.swift
//  RockPaperScissors
//
//  Created by myungsun, Yetti on 2023/05/02.
//

class Player {
    private var currentHandShape: HandShape?
    private var type: PlayerType
    
    init(type: PlayerType) {
        self.currentHandShape = nil
        self.type = type
    }
    
    func changeHandShape(to handShape: HandShape) {
        self.currentHandShape = handShape
    }
    
    func getCurrentHandShape() -> HandShape? {
        guard let handShape = self.currentHandShape else { return nil }
        return handShape
    }
    
    func makeRandomHandShape() {
        let handShapes: [HandShape] = [.rock, .paper, .scissors]
        guard let randomHandShape = handShapes.randomElement() else { return }
        changeHandShape(to: randomHandShape)
    }
}
