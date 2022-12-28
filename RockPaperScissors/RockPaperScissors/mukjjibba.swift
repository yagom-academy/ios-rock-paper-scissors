//
//  mukjjibba.swift
//  RockPaperScissors
//
//  Created by Riji, Rilla on 2022/12/28.
//

class Mukjjibba: CommonGameWorks, Game {
    func startGame() {
        printGameMenu()
        let userInput = checkAvailability(input: getUserInput())
        let userHandMotion = handleGameError(userInput: userInput)
        let computerHandMotion = makeRandomHandMotion()
        compare(userHandMotion, with: computerHandMotion)
    }
    
    func checkTurn() -> String {
        if isUserWin {
            return "사용자"
        } else {
            return "컴퓨터"
        }
    }
    
    func printGameMenu() {
        let turn = checkTurn()
        print("[\(turn)]턴 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    }
    
    func handleGameError(userInput: Result<GameMenu, GameError>) -> GameMenu? {
        switch userInput {
        case .failure(_):
            print("잘못된 입력입니다. 다시 시도해주세요")
            isUserWin = false
            startGame()
            return nil
        case .success(let handMotion):
            if handMotion == .endGame {
                print("게임종료")
                return nil
            }
            return handMotion
        }
    }
    
    func compare(_ userInput: GameMenu?, with computerInput: GameMenu?) {
        guard let user = userInput, let computer = computerInput else { return }
        switch (user, computer) {
        case (.scissor, .scissor), (.rock, .rock), (.paper, .paper) :
            checkMukjjibbaResult()
        case (.scissor, .paper), (.rock, .scissor), (.paper, .rock) :
            isUserWin = true
            startGame()
        case (.scissor, .rock), (.rock, .paper), (.paper, .scissor) :
            isUserWin = false
            startGame()
        default :
            return
        }
    }
    
    func printGameResult(gameResult: GameResult) {
        switch gameResult {
        case .win:
            print("사용자의 승리!")
        case .lose:
            print("컴퓨터의 승리!")
        default :
            return
        }
    }
    
    func checkMukjjibbaResult() {
        if isUserWin {
            printGameResult(gameResult: .win)
        } else {
            printGameResult(gameResult: .lose)
        }
    }
}
