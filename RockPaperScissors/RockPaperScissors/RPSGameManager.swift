struct RPSGameManager {
    func startGame() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let userNumber = fetchUserInput(),
              let userChoice = RockPaperScissors.init(rawValue: userNumber),
              let computerChoice = RockPaperScissors.init(rawValue: Int.random(in: 1...3)) else {
            printUserInputError()
            return startGame()
        }
        
        let gameResult = checkGameResult(computerChoice: computerChoice, userChoice: userChoice)
        handleGameResult(gameResult: gameResult)
        
    }
    
    private func handleGameResult(gameResult: GameResult) {
        switch gameResult {
        case .win:
            print("이겼습니다!")
            MCBGameManager().startGame(gameResult: .win)
        case .lose:
            print("졌습니다!")
            MCBGameManager().startGame(gameResult: .lose)
        case .draw:
            print("비겼습니다")
            startGame()
        case .exit:
            print("게임 종료")
            break
        }
    }

    private func checkGameResult(computerChoice: RockPaperScissors, userChoice: RockPaperScissors) -> GameResult {
        if computerChoice == userChoice { return .draw }
        
        switch (userChoice, computerChoice) {
        case (.scissors, .paper):
            return .win
        case (.rock, .scissors):
            return .win
        case (.paper, .rock):
            return .win
        case (.exit, _):
            return .exit
        default:
            return .win
        }
    }
}

func printUserInputError() {
    print("잘못된 입력입니다. 다시 시도해주세요")
}

func fetchUserInput() -> Int? {
    guard let userInput = readLine(),
          let userNumber = Int(userInput) else { return nil }
    
    return userNumber
}
