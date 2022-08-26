struct MukJjiPpaGame {
    private var rpsGame = RockPaperScissorsGame()

    mutating func startMJPGame() {
        rpsGame.startRPSGame()
        var gameResult = rpsGame.fetchRPSGameResult()
        
        var winnerTurn: Player? {
            if gameResult == .win {
                print("\(Player.user.rawValue)의 턴입니다")
                return .user
            } else if gameResult == .lose {
                print("\(Player.computer.rawValue)의 턴입니다")
                return .computer
            } else {
                return nil
            }
        }

        while gameResult != .draw {
            guard let winnerTurn = winnerTurn else {
                break
            }

            printMJPMenu(winnerTurn.rawValue)

            guard let userMJPNumber = fetchUserNumber() else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                gameResult = .lose
                continue
            }

            if userMJPNumber == 0 {
                print("게임 종료")
                break
            }

            let computerMJPNumber = Int.random(in: 1...3)

            guard let userMJPNumber = HandShape.convertHandShape(from: userMJPNumber, type: .mjp),
                  let computerMJPNumber = HandShape.convertHandShape(from: computerMJPNumber, type: .mjp) else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                gameResult = .lose
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
    
    private func fetchUserNumber() -> Int? {
        guard let userInput = readLine() else {
            return nil
        }
        
        return Int(userInput)
    }
}
