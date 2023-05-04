//
//  MukjippaGame.swift
//  RockPaperScissors
//
//  Created by 5조 on 2023/05/04.
//

class MukjippaGame {
    private var turn: String = ""
    private var isGameInProgress: Bool = true

    private func compare(_ computerMukjippa: MukJiPpa, and playerMukjippa: MukJiPpa) {
        
        switch (computerMukjippa, playerMukjippa) {
        case (.ppa, .ji), (.ji, .muk), (.muk, .ppa):
            self.turn = "사용자"
            print("\(turn)의 턴 입니다")
        case (.ji, .ppa), (.muk, .ji), (.ppa, .muk):
            self.turn = "컴퓨터"
            print("\(turn)의 턴 입니다")
        default:
            print("\(turn)의 승리!")
            self.isGameInProgress = false
        }
    }
    
    private func getUserInput() -> String {
        print("[\(turn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        guard let input = readLine() else { return "" }
        
        return input
    }
    
    private func checkUserInput(_ userInput: String) {
        let gameOver: String = "0"
        
        switch userInput {
        case "1", "2", "3":
            guard let playerMukjippa = MukJiPpa(rawValue: userInput),
                  let computerMukjippa = MukJiPpa(rawValue: "\(Int.random(in: 1...3))") else { return }
            compare(computerMukjippa, and: playerMukjippa)
        case gameOver:
            self.isGameInProgress = false
            print("게임 종료")
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
    
    private func checkRockPaperScissorsGameResult(_ gameResult: GameResult) {
        
        switch gameResult {
        case .victory:
            self.turn = "사용자"
        case .defeat:
            self.turn = "컴퓨터"
        case .gameOver:
            self.isGameInProgress = false
        }
    }

    func startGame() {
        let rpsGame = RockPaperScissorsGame()
        let gameResult: GameResult = rpsGame.startGame()
        
        checkRockPaperScissorsGameResult(gameResult)
        
        while self.isGameInProgress {
            let userInput = getUserInput()
            checkUserInput(userInput)
        }
    }
}
