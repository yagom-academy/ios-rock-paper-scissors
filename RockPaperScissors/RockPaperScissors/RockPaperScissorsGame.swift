struct RockPaperScissorsGame {
    func startRPSGame() {
        guard let userRPS = generateUserRPS() else {
            print("게임 종료")
            return
        }
        
        let userGameResult = decideGameResult(of: userRPS)
        
        printResult(of: userGameResult)
    }
    
    func generateUserRPS() -> RPS? {
        printMenu()
        
        guard let userInput = fetchUserInput(),
                let userRPS = RPS(rawValue: userInput) else {
            
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return generateUserRPS()
        }
        
        guard userInput != 0 else {
            return nil
        }
        
        return userRPS
    }
        
    func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    }
    
    func fetchUserInput() -> Int? {
        guard let userInput = readLine() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return nil
        }
        
        return Int(userInput)
    }
    
    func generateComputerRPS() -> RPS {
        var computerRPS: RPS {
            let RPSNumber = Int.random(in: 1...3)
            
            switch RPSNumber {
            case 1:
                return .scissors
            case 2:
                return .rock
            case 3:
                return .paper
            default :
                return generateComputerRPS()
            }
        }
        
        return computerRPS
    }
    
    func decideGameResult(of userRPS: RPS) -> Result<GameResult, GameError> {
        let computerRPS = generateComputerRPS()
        
        switch (userRPS, computerRPS) {
        case (.rock, .scissors): fallthrough
        case (.paper, .rock): fallthrough
        case (.scissors, .paper):
            return .success(.win)
            
        case (.rock, .paper): fallthrough
        case (.scissors, .rock): fallthrough
        case (.paper, .scissors):
            return .success(.lose)
            
        case (.rock, .rock): fallthrough
        case (.paper, .paper): fallthrough
        case (.scissors, .scissors):
            return .success(.draw)
        default:
            return .failure(.GameResultError)
        }
    }
    
    func printResult(of result: GameResult) {
        switch result {
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("비겼습니다!")
            startRPSGame()
        }
    }
}
    
    


