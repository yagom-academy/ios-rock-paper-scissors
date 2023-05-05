//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by yyss99 on 2023/05/03.
//

let muckJjiBba = MuckJjiBba()

struct RockPaperScissors {
    
    func startGame() {
        showGameMenu()
        
        guard let a = a() else { return }
        guard let userHandSign = HandSign(rawValue: a) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startGame()
            return
        }
        let computerInput = makeComputerInput()
        let rockPaperScissorsGameResult = checkRockPaperScissorsGameResult(userHandSign, computerInput)
        showGameResult(rockPaperScissorsGameResult)
    }
    
    func showGameMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 :0> : ", terminator: "")
    }
    
    func a() -> String? {
        guard let input = readLine(), input != "0" else {
            print("게임종료")
            return nil
        }
        return input
    }
    
    private func makeComputerInput() -> HandSign {
        return HandSign.allCases[Int.random(in: 0...2)]
    }
    
    private func checkRockPaperScissorsGameResult(_ userInput: HandSign, _ computerInput: HandSign) -> GameResult {
        switch (userInput, computerInput) {
        case (userInput, computerInput) where userInput == computerInput:
            return .draw
        case (.scissors, .paper),
            (.rock, .scissors),
            (.paper, .rock):
            return .win
        default:
            return .lose
        }
    }
    
    private func showGameResult(_ result: GameResult) {
        switch result {
        case .win:
            print("이겼습니다.")
            muckJjiBba.getUserMuckJjiBbaInput(when: .win)
        case .lose:
            print("졌습니다.")
            muckJjiBba.getUserMuckJjiBbaInput(when: .lose)
        case .draw:
            print("비겼습니다")
            showGameMenu()
        }
    }
}
