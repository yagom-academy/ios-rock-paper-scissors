struct MukChiBa {
    private var userWinningState: GameResult
    private var gameState: GameStatus
    
    init(userWinningState: GameResult) {
        self.userWinningState = userWinningState
        self.gameState = .gameIsNotOver
    }
    
    func printWinnerTurn() {
        if userWinningState == .win {
            print("[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        } else if userWinningState == .lose {
            print("[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
        }
    }
    
    func printWinnerResult() {
        if userWinningState == .win {
            print("사용자의 승리!")
        } else if userWinningState == .lose {
            print("컴퓨터의 승리!")
        }
    }
    
    func printWarningWrongInput() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }
    
    mutating func playMukChiBa(userRPSValue: RockPaperScissors) {
        let computerInputValue: Int = Int.random(in: 1...3)
        let computerRPSValue: RockPaperScissors = inputToRPS(userValue: computerInputValue)

        if userRPSValue == computerRPSValue {
            printWinnerResult()
            gameState = .gameOver
        } else if (userRPSValue == RockPaperScissors.rock && computerRPSValue == RockPaperScissors.scissors) || (userRPSValue == RockPaperScissors.scissors && computerRPSValue == RockPaperScissors.paper) || (userRPSValue == RockPaperScissors.paper && computerRPSValue == RockPaperScissors.rock) {
            userWinningState = .win
            gameState = .gameIsNotOver
        } else if (userRPSValue == RockPaperScissors.rock && computerRPSValue == RockPaperScissors.paper) || (userRPSValue == RockPaperScissors.scissors && computerRPSValue == RockPaperScissors.rock) || (userRPSValue == RockPaperScissors.paper && computerRPSValue == RockPaperScissors.scissors) {
            userWinningState = .lose
            gameState = .gameIsNotOver
        }
    }
    
    private func isGameOver(_ gameState: GameStatus) -> Bool {
        if gameState == .gameOver {
            return true
        } else {
            return false
        }
    }
    
    private func inputToRPS(userValue: Int) -> RockPaperScissors {
        if userValue == 1 {
            return .scissors
        } else if userValue == 2 {
            return .rock
        } else if userValue == 3 {
            return .paper
        } else {
            return .scissors
        }
    }
    
    mutating func playGame() -> Bool {
        printWinnerTurn()
        if let userInput: String = readLine() {
            switch userInput {
            case "0":
                print("게임 종료")
                return false
            case "1", "2", "3":
                if let userRPSIntValue = Int(userInput) {
                    let userRPSValue = inputToRPS(userValue: userRPSIntValue)
                    playMukChiBa(userRPSValue: userRPSValue)
                    return isGameOver(gameState)
                }
            default:
                userWinningState = .lose
                printWarningWrongInput()
                return isGameOver(gameState)
            }
        }
        
        return isGameOver(gameState)
    }
}

