//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 5조 on 2023/05/04.
//


struct RockPaperScissorsGame {
    private var gameResult: GameResult?
    
    private mutating func compare(_ computerRockPaperScissors: RockPaperScissors, and playerRockPaperScissors: RockPaperScissors) {
        switch (computerRockPaperScissors, playerRockPaperScissors) {
        case (.paper, .scissors), (.scissors, .rock), (.rock, .paper):
            gameResult = .victory
            print("이겼습니다!")
        case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
            gameResult = .defeat
            print("졌습니다!")
        default:
            gameResult = nil
            print("비겼습니다!")
        }
    }

    private func getUserInput() -> String {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        guard let input = readLine() else { return "" }
        
        return input
    }

    private mutating func resultsThroughUserInput(_ userInput: String) {
        
        switch userInput {
        case "1", "2", "3":
            guard let userInput = Int(userInput),
                  let playerRockPaperScissors = RockPaperScissors(rawValue: userInput),
                  let computerRockPaperScissors = RockPaperScissors(rawValue: Int.random(in: 1...3)) else { return }
            compare(computerRockPaperScissors, and: playerRockPaperScissors)
        case "0":
            gameResult = .gameOver
            print("게임 종료")
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }

    mutating func startGame() -> GameResult {
        repeat {
            let userInput = getUserInput()
            resultsThroughUserInput(userInput)
        } while gameResult == nil ? true : false
        
        guard let gameResult = gameResult else { return GameResult.gameOver }
        
        return gameResult
    }
}

