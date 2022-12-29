//
//  Mukjjibba.swift
//  RockPaperScissors
//
//  Created by riji, rilla on 2022/12/28.
//

class Mukjjibba: GameProtocol {
    var isUserWin = false
    func startGame() {
        printGameMenu()
        let userInput = checkAvailability(input: getUserInput())
        let userHandMotion = handleGameError(userInput: userInput)
        let computerHandMotion = makeRandomHandMotion()
        guard let result = compare(userHandMotion, with: computerHandMotion) else { return }
        printResult(gameResult: result)
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
        print("[\(turn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator:" ")
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
    
    func compare(_ userInput: GameMenu?, with computerInput: GameMenu?) -> GameResult? {
        guard let user = userInput,
              let computer = computerInput else { return nil }
        switch (user, computer) {
        case (.scissor, .scissor), (.rock, .rock), (.paper, .paper) :
            let result = checkMukjjibbaResult()
            return result
        case (.scissor, .paper), (.rock, .scissor), (.paper, .rock) :
            isUserWin = true
            startGame()
            return nil
        case (.scissor, .rock), (.rock, .paper), (.paper, .scissor) :
            isUserWin = false
            startGame()
            return nil
        default :
            return nil
        }
    }
    
    func printResult(gameResult: GameResult) {
        switch gameResult {
        case .win:
            print("사용자의 승리!")
        case .lose:
            print("컴퓨터의 승리!")
        default :
            return
        }
    }
    
    func checkMukjjibbaResult() -> GameResult {
        if isUserWin {
            return .win
        } else {
            return .lose
        }
    }
}
