//
//  RockPaperScissors - GameManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct GameManager {
    enum GameMessage {
        static let endingMessage = "게임 종료"
        static let winningMessage = "이겼습니다!"
        static let losingMessage = "졌습니다!"
        static let drawMessage = "비겼습니다!"
        static let invalidHandShapeRawValue = "잘못된 입력입니다. 다시 시도해주세요."
        static let userInputManual = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    }
    
    func startRockPaperScissorsGame() {
        guard let userHandShape = receiveHandShapeFromUser() else {
            print(GameMessage.endingMessage)
            return
        }
        let gameResult = fetchGameResult(of: userHandShape)
        
        switch gameResult {
        case .win:
            print(GameMessage.winningMessage)
            return
        case .lose:
            print(GameMessage.losingMessage)
            return
        case .draw:
            print(GameMessage.drawMessage)
            startRockPaperScissorsGame()
        }
    }
    
    private func receiveHandShapeFromUser() -> HandShape? {
        let userHandShapeRawValue = receiveHandShapeRawValueFromUser()
        
        if userHandShapeRawValue == 0 {
            return nil
        }
        return HandShape.init(rawValue: userHandShapeRawValue)
    }
    
    private func receiveHandShapeRawValueFromUser() -> Int {
        print(GameMessage.userInputManual, terminator: "")
        guard let input = readLine(),
              let HandShapeRawValue = Int(input),
              HandShapeRawValue >= 0,
              HandShapeRawValue <= 3 else {
            print(GameMessage.invalidHandShapeRawValue)
            return receiveHandShapeRawValueFromUser()
        }
        
        return HandShapeRawValue
    }
    
    private func fetchGameResult(of userHandShape: HandShape) -> GameResult {
        let computerHandShape = generateComputerHandShape()
        let rawValueDifference = computerHandShape.rawValue - userHandShape.rawValue
        
        if rawValueDifference == 0 {
            return .draw
        } else if rawValueDifference == -1 || rawValueDifference == 2 {
            return .win
        } else {
            return .lose
        }
    }
    
    private func generateComputerHandShape() -> HandShape {
        guard let computerHandShape = HandShape.init(rawValue: Int.random(in: 1...3)) else { return generateComputerHandShape() }
        return computerHandShape
    }
}
