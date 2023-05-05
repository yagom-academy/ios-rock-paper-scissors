//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by yyss99, Hemg on 2023/05/03.
//

let muckJjiBba = MuckJjiBba()

struct RockPaperScissors {
    
    func startGame() {
        showGameMenu()
        
        guard let userInput = readLine(),
              validate(userInput) else { return }
        
        guard let userHandSign = HandSign(rawValue: userInput) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startGame()
            return
        }
        let computerHandSign = makeComputerHandSign()
        let rockPaperScissorsGameResult = checkRockPaperScissorsGameResult(userHandSign, computerHandSign)
        showGameResult(rockPaperScissorsGameResult)
    }
    
    private func showGameMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 :0> : ", terminator: "")
    }
    
    private func validate(_ userInput: String) -> Bool {
        return userInput != "0"
    }
    
    private func makeComputerHandSign() -> HandSign {
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
            muckJjiBba.startGame(.win)
        case .lose:
            print("졌습니다.")
            muckJjiBba.startGame(.lose)
        case .draw:
            print("비겼습니다")
            startGame()
        }
    }
}
