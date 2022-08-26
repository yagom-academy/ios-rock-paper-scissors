//
//  RockPaperScissors - GameManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct GameManager {
    
    func startRockPaperScissorsGame() {
        print(ManualMessage.rockPaperScissorsManual, terminator: "")
        guard let menuNumber = receiveMenuNumber() else {
            print(ErrorMessage.invalidMenuNumber)
            return startRockPaperScissorsGame()
        }
        
        guard let userHandShape = receiveHandShape(of: menuNumber, handShapeType: .rockPaperScissors) else {
            print(ManualMessage.ending)
            return
        }
        
        guard let computerHandShape = receiveHandShape(handShapeType: .rockPaperScissors) else {
            print(ErrorMessage.emptyComputerHandShape)
            return startRockPaperScissorsGame()
        }
        
        let gameResult = fetchRockPaperScissorsGameResult(comparing: userHandShape, and: computerHandShape)
        gameResult.printMessage()
        
        guard let winner = gameResult.winner else {
            return startRockPaperScissorsGame()
        }
        startMukJjiBbaGame(winner)
    }
    
    private func receiveHandShape(of menuNumber: Int = Int.random(in: 1...3), handShapeType: HandShapeType) -> HandShape? {
        let handShape = HandShape.init(rawValue: menuNumber, option: handShapeType)
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
    
    private func fetchRockPaperScissorsGameResult(comparing userHandShape: HandShape, and computerHandShape: HandShape) -> RockPaperScissorsGameResult {
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
    
    private func startMukJjiBbaGame(_ turnPlayer: String) {
        let turnPlayer = turnPlayer
        let turnInformation = "[\(turnPlayer) 턴]"
        print(turnInformation, ManualMessage.mukJjiBbaManual, terminator: "")
        
        guard let menuNumber = receiveMenuNumber() else {
            print(ErrorMessage.invalidMenuNumber)
            return startMukJjiBbaGame(Player.computer)
        }
        
        guard let userHandShape = receiveHandShape(of: menuNumber, handShapeType: .mukJjiBba) else {
            print(ManualMessage.ending)
            return
        }
        
        guard let computerHandShape = receiveHandShape(handShapeType: .mukJjiBba) else {
            print(ErrorMessage.emptyComputerHandShape)
            return startRockPaperScissorsGame()
        }

        let gameResult = fetchMukJjiBbaGameResult(comparing: userHandShape, and: computerHandShape)
        gameResult.printMessage(turnPlayer)
        
        if gameResult.shouldReMatch {
            guard let nextTurnPlayer = gameResult.nextTurnPlayer else {
                print(ErrorMessage.emptyNextTurnPlayer)
                return
            }
            startMukJjiBbaGame(nextTurnPlayer)
        }
    }

    private func fetchMukJjiBbaGameResult(comparing userHandShape: HandShape, and computerHandShape: HandShape) -> MukJjiBbaGameResult {
        switch (userHandShape, computerHandShape) {
        case (HandShape.rock , HandShape.scissors),
            (HandShape.paper , HandShape.rock),
            (HandShape.scissors , HandShape.paper):
            return .reMatch(RockPaperScissorsGameResult.win)
        case (HandShape.scissors , HandShape.rock),
            (HandShape.rock , HandShape.paper),
            (HandShape.paper , HandShape.scissors):
            return .reMatch(RockPaperScissorsGameResult.lose)
        default:
            return .win
        }
    }
}
