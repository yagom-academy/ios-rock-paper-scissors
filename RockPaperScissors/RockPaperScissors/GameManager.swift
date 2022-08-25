//
//  RockPaperScissors - GameManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import CoreGraphics

struct GameManager {
    
    func startRockPaperScissorsGame() {
        print(ManualMessage.rockPaperScissorsManual, terminator: "")
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
    
    private func fetchGameResult(of userHandShape: HandShape) -> RockPaperScissorsGameResult {
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
    
    private func startMukJjiBbaGame(_ turnPlayer: String) {
        var turnPlayer = turnPlayer
        let turnInfomation = "[\(turnPlayer) 턴]"
        print(turnInfomation, ManualMessage.mukJjiBbaManual, terminator: "")
        
        guard let menuNumber = receiveMenuNumber() else {
            print(ErrorMessage.invalidMenuNumber)
            return startMukJjiBbaGame(Player.computer)
        }
        
        guard let userHandShape = HandShape.init(rawValue: menuNumber, isMukJjiBba: true) else {
            print(ManualMessage.ending)
            return
        }
        
        let computerHandShape = generateComputerHandShape()
        
        let gameResult = fetchGameResult(comparing: userHandShape, and: computerHandShape)
        
        switch gameResult {
        case .win:
            let winningMessage = "\(turnPlayer)의 승리!"
            print(winningMessage)
            return
        case .reMatch(let rockPaperScissorsGameResult):
            if rockPaperScissorsGameResult == .win {
                turnPlayer = Player.user
            } else {
                turnPlayer = Player.computer
            }
            let reMatchMessage = "\(turnPlayer)턴 입니다."
            print(reMatchMessage)
            return startMukJjiBbaGame(turnPlayer)
        }
    }

    private func fetchGameResult(comparing userHandShape: HandShape, and computerHandShape: HandShape) -> MukJjiBbaGameResult {
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
