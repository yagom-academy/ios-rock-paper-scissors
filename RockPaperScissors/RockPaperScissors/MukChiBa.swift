struct MukChiBa {
    private var userWinningState: GameResultState
    
    init(userWinningState: GameResultState) {
        self.userWinningState = userWinningState
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
    
    mutating func mukChiBaPlay(userRPSValue: Int) -> Bool {
        let computerRPSValue: Int = Int.random(in: 1...3)

        if userRPSValue == computerRPSValue {
            printWinnerResult()
            return false
        } else if (userRPSValue == 1 && computerRPSValue == 2) || (userRPSValue == 2 && computerRPSValue == 3) || (userRPSValue == 3 && computerRPSValue == 1) {
            userWinningState = .win
            return true
        } else if (userRPSValue == 1 && computerRPSValue == 3) || (userRPSValue == 2 && computerRPSValue == 1) || (userRPSValue == 3 && computerRPSValue == 2) {
            userWinningState = .lose
            return true
        } else {
            return true
        }
    }
    
    mutating func gamePlay() -> Bool {
        printWinnerTurn()
        if let userInput: String = readLine() {
            switch userInput {
            case "0":
                print("게임 종료")
                return false
            case "1", "2", "3":
                if let userInputToInt = Int(userInput) {
                    return mukChiBaPlay(userRPSValue: userInputToInt)
                }
            default:
                userWinningState = .lose
                print("잘못된 입력입니다. 다시 시도해주세요.")
                return true
            }
        }
        
        return true
    }
}
