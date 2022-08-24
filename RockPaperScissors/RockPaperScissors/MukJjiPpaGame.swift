struct MukJjiPpaGame {
    private var currentTurn: Player = .none
    
    mutating func startMJPGame() {
        var RPSGame = RockPaperScissorsGame()

        RPSGame.startRPSGame()
        currentTurn = RPSGame.RPSWinner
        
        var isPlayPossible = true
        while isPlayPossible {
            printMJPMenu()
            guard let userMJPNumber = RPSGame.fetchUserNumber() else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                currentTurn = .computer
                continue
            }
            
            if userMJPNumber == 0 {
                print("게임종료")
                break
            }
            
            let computerMJPNumber = Int.random(in: 1...3)
            
            guard let userMJPNumber = RPS.convertRPS(from: userMJPNumber),
                  let computerMJPNumber = RPS.convertRPS(from: computerMJPNumber) else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            let gameMJPResult = GameResult.judgeUserGameResultIn(userMJPNumber, computerMJPNumber)
            
            switch gameMJPResult {
            case .win:
                currentTurn = .user
                print("\(currentTurn.rawValue)의 턴입니다.")
            case .lose:
                currentTurn = .computer
                print("\(currentTurn.rawValue)의 턴입니다.")
            case .draw:
                print("\(currentTurn.rawValue)의 승리!")
                isPlayPossible = false
            }
        }
    }
    
    private func printMJPMenu() {
        print("[\(currentTurn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    }
}
