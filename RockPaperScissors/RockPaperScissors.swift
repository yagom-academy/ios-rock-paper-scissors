//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by yyss99 on 2023/05/03.
//

struct RockPaperScissors {
    func showGameMenu() {
        
        print("가위(1), 바위(2), 보(3)! <종료 :0> : ", terminator: "")
        
        guard let userInput: String = readLine() else { return }
        let computerInput = makeComputerInput()
        
        checkGameEnd(userInput)
        getUserInput(userInput, computerInput)
    }
    
    private func checkGameEnd(_ userInput: String) {
        guard userInput != "0" else { return print("게임종료") }
    }
    
    private func makeComputerInput() -> String {
        return String(Int.random(in: 1...3))
    }
    
    private func getUserInput(_ userInput: String, _ computerInput: String) {
        switch userInput {
        case HandSign.scissors.rawValue,
            HandSign.rock.rawValue,
            HandSign.paper.rawValue:
            let gameResult = checkRockPaperScissors(with: userInput, computerInput)
            showGameResult(gameResult)
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            showGameMenu()
        }
    }
    
    private func checkRockPaperScissors(with userInput: String, _ computerInput: String) -> GameResult {
        switch (userInput, computerInput) {
        case (userInput, computerInput) where userInput == computerInput:
            return .draw
        case (HandSign.scissors.rawValue, HandSign.paper.rawValue),
            (HandSign.rock.rawValue, HandSign.scissors.rawValue),
            (HandSign.paper.rawValue, HandSign.rock.rawValue):
            return .win
        default:
            return .lose
        }
    }
    
    private func showGameResult(_ result: GameResult) {
        switch result {
        case .win:
            print("이겼습니다.")
            
        case .lose:
            print("졌습니다.")
            
        case .draw:
            print("비겼습니다")
            showGameMenu()
        }
    }
}
