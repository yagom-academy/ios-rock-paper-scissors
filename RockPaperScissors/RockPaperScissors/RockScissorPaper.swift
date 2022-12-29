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
        let userInput = checkAvailability(input: getUserInput())
        let userHandMotion = handleGameError(userInput: userInput)
        let computerHandMotion = makeRandomHandMotion()
        compare(userHandMotion, with: computerHandMotion)
    }
    
    func printGameMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: " ")
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
    
    func compare(_ userInput: GameMenu?, with computerInput: GameMenu?) {
        guard let user = userInput, let computer = computerInput else { return }
        switch (user, computer) {
        case (.scissor, .paper), (.rock, .scissor), (.paper, .rock) :
            printGameResult(gameResult: .win)
            isUserWin = true
        case (.scissor, .rock), (.rock, .paper), (.paper, .scissor) :
            printGameResult(gameResult: .lose)
            isUserWin = false
        default : printGameResult(gameResult: .draw)
        }
    }
    
    func printGameResult(gameResult: GameResult) {
        switch gameResult {
        case .win:
            print("이겼습니다!")
            isUserWin = true
            mukjjibba.startGame()
        case .lose:
            print("졌습니다!")
            isUserWin = false
            mukjjibba.startGame()
        case .draw:
            print("비겼습니다!")
            startGame()
        }
    }
}
