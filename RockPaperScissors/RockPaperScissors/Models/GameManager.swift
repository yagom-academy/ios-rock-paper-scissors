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
        var winner: PlayerType?
        
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
                winner = getGameResult(computerHandShape, userHandShape).player
                
                user.changeHandShape(to: userHandShape)
                print("\(resultMessage)")
            }
        }
        guard let winner = winner else { return }
        startMukChiPa(winner, computer, user)
    }
    
    func startMukChiPa(_ winner: PlayerType, _ computer: GamePlayer, _ user: GamePlayer) {
        let handShapes: [HandShape] = [.rock, .scissors, .paper]
        let computer: GamePlayer = computer
        let user: GamePlayer = user
        let endOption: Int = 0
        var currentTurnOwner: PlayerType = winner
        var isGameOn: Bool = true
        
        while isGameOn {
            guard let gameOptionNumber = inputGameOptionNumber(gameType: .mukChiPa, currentTurnOwner) else {
                currentTurnOwner = .computer
                continue
            }
            
            computer.makeRandomHandShape()
            guard let computerHandShape = computer.getCurrentHandShape() else { continue }
            
            switch gameOptionNumber {
            case endOption:
                isGameOn = false
                print("게임종료")
            default:
                let userHandShape = handShapes[gameOptionNumber - 1]
                guard let winner = getGameResult(computerHandShape, userHandShape).player else {
                    isGameOn = false
                    print("\(currentTurnOwner.rawValue)의 승리!")
                    return
                }
                isGameOn = !getGameResult(computerHandShape, userHandShape).isGameOn
                user.changeHandShape(to: userHandShape)
                currentTurnOwner = winner
                print("\(currentTurnOwner.rawValue)의 턴입니다.")
            }
        }
    }
    
    private func getGameResult(_ computerHandShape: HandShape, _ userHandShape: HandShape) -> (isGameOn: Bool, resultMessage: String, player: PlayerType?) {
        switch (computerHandShape, userHandShape) {
        case let (computerHandShape, userHandShape) where computerHandShape == userHandShape:
            return (true, "비겼습니다.", nil)
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            return (false, "이겼습니다!", .person)
        default:
            return (false, "졌습니다!", .computer)
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
