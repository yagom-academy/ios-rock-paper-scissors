//
//  GameManager.swift
//  RockPaperScissors
//
//  Created by myungsun, Yetti on 2023/05/02.
//

class GameManager {
    func startGame() {
        let computer: GamePlayer = GamePlayer(type: .computer)
        let user: GamePlayer = GamePlayer(type: .person)
        let handShapes: [HandShape] = [.scissors, .rock, .paper]
        var isGameOn: Bool = true
        
        while isGameOn {
            guard let gameOptionNumber = inputGameOptionNumber(gameType: .rockPaperScissors) else { continue }
            
            computer.makeRandomHandShape()
            guard let computerHandShape = computer.getCurrentHandShape() else { continue }
            
            switch gameOptionNumber {
            case 0:
                isGameOn = false
                print("게임 종료")
            default:
                let userHandShape = handShapes[gameOptionNumber - 1]
                let resultMessage = getGameResult(computerHandShape, userHandShape).resultMessage
                isGameOn = getGameResult(computerHandShape, userHandShape).isGameOn
                
                user.changeHandShape(to: userHandShape)
                print("\(resultMessage)")
            }
        }
    }
    
    private func getGameResult(_ computerHandShape: HandShape, _ userHandShape: HandShape) -> (isGameOn: Bool, resultMessage: String) {
        switch (computerHandShape, userHandShape) {
        case let (computerHandShape, userHandShape) where computerHandShape == userHandShape:
            return (true, "비겼습니다.")
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            return (false, "이겼습니다!")
        default:
            return (false, "졌습니다!")
        }
    }
    
    private func inputGameOptionNumber(gameType: GameType, _ currentPlayer: PlayerType? = nil) -> Int? {
        let validOptionRange: ClosedRange<Int> = 0...3
        showGameMessageWith(gameType, currentPlayer)
        
        guard let gameOption = readLine(),
              let gameOptionNumber = Int(gameOption),
              validOptionRange.contains(gameOptionNumber) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return nil
        }
        
        return gameOptionNumber
    }
    
    private func showGameMessageWith(_ gameType: GameType, _ currentPlayer: PlayerType?) {
        switch gameType {
        case .rockPaperScissors:
            print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        case .mukChiPa:
            guard let currentPlayer = currentPlayer else { return }
            print("[\(currentPlayer.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        }
    }
}
