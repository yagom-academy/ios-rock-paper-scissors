//
//  GameManager.swift
//  RockPaperScissors
//
//  Created by myungsun, Yetti on 2023/05/02.
//

class GameManager {
    private let computer: GamePlayer = GamePlayer(type: .computer)
    private let user: GamePlayer = GamePlayer(type: .person)
    private let endOption: Int = 0
    private var isGameOn: Bool = true
    private var winner: PlayerType?
    private var currentGameType: GameType = .rockPaperScissors
    private var handShapes: [HandShape] {
        switch currentGameType {
        case .rockPaperScissors:
            return [.scissors, .rock, .paper]
        case .mukChiPa:
            return [.rock, .scissors, .paper]
        }
    }
    
    func startGame() {
        let (winner, computer, user) = startRockPaperScissors()
        guard let winner = winner,
              let computer = computer,
              let user = user  else { return }
        startMukChiPa(winner, computer, user)
    }
    
    private func startRockPaperScissors() -> (winner: PlayerType?, computer: GamePlayer?, user: GamePlayer?) {
        while isGameOn {
            guard let gameOptionNumber = inputGameOptionNumber(gameType: .rockPaperScissors) else { continue }
            
            computer.makeRandomHandShape()
            guard let computerHandShape = computer.getCurrentHandShape() else { continue }
            
            switch gameOptionNumber {
            case endOption:
                print("게임 종료")
                return (nil, nil, nil)
            default:
                let userHandShape = handShapes[gameOptionNumber - 1]
                let resultMessage = getRockPaperScissorsResult(computerHandShape, userHandShape).resultMessage
                isGameOn = getRockPaperScissorsResult(computerHandShape, userHandShape).isGameOn
                winner = getRockPaperScissorsResult(computerHandShape, userHandShape).winner
                
                user.changeHandShape(to: userHandShape)
                print(resultMessage)
            }
        }
        return (winner, computer, user)
    }
    
    private func startMukChiPa(_ winner: PlayerType, _ computer: GamePlayer, _ user: GamePlayer) {
        var currentTurnOwner: PlayerType = winner
        currentGameType = .mukChiPa
        isGameOn = true

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
                guard let winner = getMukChiPaResult(computerHandShape, userHandShape, currentTurnOwner) else { return }
                
                user.changeHandShape(to: userHandShape)
                currentTurnOwner = winner
                showCurrentPlayerTurn(with: currentTurnOwner)
            }
        }
    }
    
    private func getRockPaperScissorsResult(_ computerHandShape: HandShape, _ userHandShape: HandShape) -> (isGameOn: Bool, resultMessage: String, winner: PlayerType?) {
        let gameResult: GameResult = compare(computerHandShape, with: userHandShape)
        
        switch gameResult {
        case .draw:
            return (true, "비겼습니다.", nil)
        case .win:
            return (false, "이겼습니다!", .person)
        case .lose:
            return (false, "졌습니다!", .computer)
        }
    }
    
    private func compare(_ computerHandShape: HandShape, with userHandShape: HandShape) -> GameResult {
        switch (computerHandShape, userHandShape) {
        case let (computerHandShape, userHandShape) where computerHandShape == userHandShape:
            return .draw
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            return .win
        default:
            return .lose
        }
    }
    
    private func getMukChiPaResult(_ computerHandShape: HandShape, _ userHandShape: HandShape, _ currentTurnOwner: PlayerType) -> PlayerType? {
        guard let winner = getRockPaperScissorsResult(computerHandShape, userHandShape).winner else {
            showMukChiPaGameWinner(with: currentTurnOwner)
            return nil
        }
        return winner
    }
    
    private func inputGameOptionNumber(gameType: GameType, _ currentTurnOwner: PlayerType? = nil) -> Int? {
        let validOptionRange: ClosedRange<Int> = 0...3
        showGameMessageWith(gameType, currentTurnOwner)
        
        guard let gameOption = readLine(),
              let gameOptionNumber = Int(gameOption),
              validOptionRange.contains(gameOptionNumber) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return nil
        }
        
        return gameOptionNumber
    }
    
    private func showGameMessageWith(_ gameType: GameType, _ currentTurnOwner: PlayerType?) {
        switch gameType {
        case .rockPaperScissors:
            print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        case .mukChiPa:
            guard let currentTurnOwner = currentTurnOwner else { return }
            print("[\(currentTurnOwner.description) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        }
    }
    
    private func showMukChiPaGameWinner(with currentTurnOwner: PlayerType) {
        print("\(currentTurnOwner.description)의 승리!")
    }
    
    private func showCurrentPlayerTurn(with currentTurnOwner: PlayerType) {
        print("\(currentTurnOwner.description)의 턴입니다.")
    }
}
