struct MukJjiPpaGame {
    mutating func startMJPGame() {
        var RPSGame = RockPaperScissorsGame()
        var winnerTurn: Player = .user
        var gameResult = RPSGame.fetchRPSGameResult() {
            didSet {
                if gameResult == .win {
                    winnerTurn = .user
                } else if gameResult == .lose {
                    winnerTurn = .computer
                }
            }
        }
        
        RPSGame.startRPSGame()
        
        while gameResult != .draw {
            printMJPMenu(winnerTurn.rawValue)
            
            guard let userMJPNumber = RPSGame.fetchUserNumber() else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                winnerTurn = .computer
                continue
            }
            
            if userMJPNumber == 0 {
                print("게임종료")
                break
            }
            
            let computerMJPNumber = Int.random(in: 1...3)
            
            guard let userMJPNumber = RPS.convertMJP(from: userMJPNumber),
                  let computerMJPNumber = RPS.convertMJP(from: computerMJPNumber) else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            
            gameResult = GameResult.judgeUserGameResultIn(userMJPNumber, computerMJPNumber)
            
            if gameResult == .draw {
                print("\(winnerTurn.rawValue)의 승리입니다.")
            }
        }
    }

    private func printMJPMenu(_ winner: String) {
        print("[\(winner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :", terminator: " ")
    }
}
