struct RockPaperScissorsGame {
    var RPSWinner: String = ""
    mutating func startRPSGame() {
        printMenu()
        
        guard let userRPSNumber = fetchUserNumber() else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return startRPSGame()
        }
        
        if userRPSNumber == 0 {
            print("게임종료")
            return
        }
        
        let computerRPSNumber = Int.random(in: 1...3)
        
        guard let userRPS = RPS.convertRPS(from: userRPSNumber),
              let computerRPS = RPS.convertRPS(from: computerRPSNumber) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return startRPSGame()
        }
        
        let gameRPSResult = GameResult.judgeUserGameResultIn(userRPS, computerRPS)
        
        printResult(of: gameRPSResult)
        
        switch gameRPSResult {
        case .win:
            RPSWinner = "사용자"
            return
        case .lose:
            RPSWinner = "컴퓨터"
            return
        case .draw:
            startRPSGame()
        }
    }

    
    func printMenu() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
    }
    
    func fetchUserNumber() -> Int? {
        guard let userInput = readLine() else {
            return nil
        }
        
        return Int(userInput)
    }
    
    func printResult(of result: GameResult) {
        switch result {
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("비겼습니다!")
        }
    }
}
