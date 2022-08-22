//
//  RockPaperScissors - GameManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct GameManager {
    func startRockPaperScissorsGame() {
        guard let userHandShape = receiveHandShapeFromUser() else {
            print("게임 종료")
            return
        }
        let gameResult = fetchGameResult(of: userHandShape)
        
        switch gameResult {
        case .win:
            print("이겼습니다!")
            return
        case .lose:
            print("졌습니다!")
            return
        case .draw:
            print("비겼습니다!")
            startRockPaperScissorsGame()
        }
    }
    
    private func receiveHandShapeFromUser() -> HandShape? {
        printRockPaperScissorsManual()
        let userInput = receiveInputFromUser()
        guard let convertedInput = Int(userInput) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return receiveHandShapeFromUser()
        }
        
        switch convertedInput {
        case 1...3:
            return HandShape.init(rawValue: convertedInput)
        case 0:
            return nil
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return receiveHandShapeFromUser()
        }
    }
    
    private func printRockPaperScissorsManual() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }
    
    private func receiveInputFromUser() -> String {
        guard let input = readLine() else { return "" }
        return input
    }
    
    private func fetchGameResult(of userHandShape: HandShape) -> GameResult {
        let computerHandShape = generateRandomHandShape()
        
        if userHandShape == computerHandShape {
            return .draw
        } else if userHandShape.isWin(comparing: computerHandShape) {
            return .win
        } else {
            return .lose
        }
    }
    
    private func generateRandomHandShape() -> HandShape {
        guard let handShape = HandShape.init(rawValue: Int.random(in: 1...3)) else { return generateRandomHandShape() }
        return handShape
    }
}
