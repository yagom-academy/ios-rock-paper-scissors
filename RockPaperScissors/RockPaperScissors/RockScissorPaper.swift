//
//  RockScissorPaper.swift
//  RockPaperScissors
//
//  Created by riji, rilla on 2022/12/28.
//

class RockScissorPaper: GameProtocol {
    let mukjjibba = Mukjjibba()
    
    func startGame() {
        printGameMenu()
        let userInput: Result<GameMenu, GameError> = checkAvailability(input: getUserInput())
        let userHandMotion: GameMenu? = handleGameError(userInput: userInput)
        let computerHandMotion: GameMenu? = makeRandomHandMotion()
        guard let result: GameResult = compare(userHandMotion, with: computerHandMotion) else { return }
        printResult(gameResult: result)
    }
    
    func printGameMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator:" ")
    }
    
    func handleGameError(userInput: Result<GameMenu, GameError>) -> GameMenu? {
        switch userInput {
        case .failure(_):
            print("잘못된 입력입니다. 다시 시도해주세요")
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
        guard let user: GameMenu = userInput,
              let computer: GameMenu = computerInput else { return nil }
        switch (user, computer) {
        case (.scissor, .paper), (.rock, .scissor), (.paper, .rock) :
            mukjjibba.isUserWin = true
            return .win
        case (.scissor, .rock), (.rock, .paper), (.paper, .scissor) :
            mukjjibba.isUserWin = false
            return .lose
        default :
            return .draw
        }
    }
    
    func printResult(gameResult: GameResult) {
        switch gameResult {
        case .win:
            print("이겼습니다!")
            mukjjibba.isUserWin = true
            mukjjibba.startGame()
        case .lose:
            print("졌습니다!")
            mukjjibba.isUserWin = false
            mukjjibba.startGame()
        case .draw:
            print("비겼습니다!")
            startGame()
        }
    }
}
