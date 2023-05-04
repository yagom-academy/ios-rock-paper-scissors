//
//  MukjippaGame.swift
//  RockPaperScissors
//
//  Created by 5조 on 2023/05/04.
//

class MukjippaGame {
    var turn: Turn

    init(turn: Turn) {
        self.turn = turn
    }
    
    func compare(_ computerMukjippa: MukJiPpa, and playerMukjippa: MukJiPpa) -> Bool {
        var isGameOver: Bool = false

        switch (computerMukjippa, playerMukjippa) {
        case (.ppa, .ji), (.ji, .muk), (.muk, .ppa):
            turn = .user
            print("\(turn)의 턴 입니다")
        case (.ji, .ppa), (.muk, .ji), (.ppa, .muk):
            turn = .computer
            print("\(turn)의 턴 입니다")
        default:
            print("\(turn)의 승리!")
            isGameOver = true
        }
        
        return isGameOver
    }

    func getUserInput() -> String {
        print("[\(turn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
        guard let input = readLine() else { return "" }
        
        return input
    }

    func checkUserInput(_ userInput: String) -> Bool {
        var isGameInProgress: Bool = true
        let gameOver: String = "0"
        
        switch userInput {
        case "1", "2", "3":
            guard let playerMukjippa = MukJiPpa(rawValue: userInput),
                  let computerMukjippa = MukJiPpa(rawValue: "\(Int.random(in: 1...3))") else {
                return isGameInProgress
            }
            isGameInProgress = !compare(computerMukjippa, and: playerMukjippa)
        case gameOver:
            isGameInProgress = false
            print("게임 종료")
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
        return isGameInProgress
    }

    func startGame() {
        var isGameInProgress: Bool = true
        
        repeat {
            let userInput = getUserInput()
            isGameInProgress = checkUserInput(userInput)
        } while isGameInProgress
    }
}
