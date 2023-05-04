//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by 5조 on 2023/05/04.
//

class RockPaperScissorsGame {
    
    func compare(_ computerRockPaperScissors: RockPaperScissors, and playerRockPaperScissors: RockPaperScissors) -> Bool {
        var isGameOver: Bool = true

        switch (computerRockPaperScissors, playerRockPaperScissors) {
        case (.paper, .scissors), (.scissors, .rock), (.rock, .paper):
            print("이겼습니다!")
        case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
            print("졌습니다!")
        default:
            print("비겼습니다!")
            isGameOver = false
        }
        
        return isGameOver
    }

    func getUserInput() -> String {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        guard let input = readLine() else { return "" }
        
        return input
    }

    func checkUserInput(_ userInput: String) -> Bool {
        var isGameInProgress: Bool = true
        let gameOver: String = "0"
        
        switch userInput {
        case "1", "2", "3":
            guard let playerRockPaperScissors = RockPaperScissors(rawValue: userInput),
                  let computerRockPaperScissors = RockPaperScissors(rawValue: "\(Int.random(in: 1...3))") else {
                return isGameInProgress
            }
            isGameInProgress = !compare(computerRockPaperScissors, and: playerRockPaperScissors)
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
