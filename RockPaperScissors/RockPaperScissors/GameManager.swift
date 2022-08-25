//
//  RockPaperScissors - GameManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct GameManager {
    
    func startRockPaperScissorsGame() {
        print(ManualMessage.userInputManual, terminator: "")
        guard let menuNumber = receiveMenuNumber() else {
            print(ErrorMessage.invalidMenuNumber)
            return startRockPaperScissorsGame()
        }
        
        guard let userHandShape = receiveHandShape(of: menuNumber) else {
            print(ManualMessage.ending)
            return
        }
        let gameResult = fetchGameResult(of: userHandShape)
        
        switch gameResult {
        case .win:
            print(GameResultMessage.winning)
            return
        case .lose:
            print(GameResultMessage.losing)
            return
        case .draw:
            print(GameResultMessage.draw)
            startRockPaperScissorsGame()
        }
    }
    
    private func receiveHandShape(of menuNumber: Int) -> HandShape? {
        let handShape = HandShape.init(rawValue: menuNumber)
        return handShape
    }
    
    private func receiveMenuNumber() -> Int? {
        guard let input = readLine(),
              let HandShapeRawValue = Int(input),
              HandShapeRawValue >= 0,
              HandShapeRawValue <= 3 else {
            return nil
        }
        
        return HandShapeRawValue
    }
    
    private func fetchGameResult(of userHandShape: HandShape) -> GameResult {
        let computerHandShape = generateComputerHandShape()

        switch (userHandShape, computerHandShape) {
        case (HandShape.rock , HandShape.scissors),
            (HandShape.paper , HandShape.rock),
            (HandShape.scissors , HandShape.paper):
            return .win
        case (HandShape.scissors , HandShape.rock),
            (HandShape.rock , HandShape.paper),
            (HandShape.paper , HandShape.scissors):
            return .lose
        default:
            return .draw
        }
    }
    
    private func generateComputerHandShape() -> HandShape {
        guard let computerHandShape = HandShape.init(rawValue: Int.random(in: 1...3)) else { return generateComputerHandShape() }
        return computerHandShape
    }
}
