enum Choice: Int {
    case end = 0
    case rock = 1
    case paper = 2
    case scissors = 3
}

enum Result {
    case win
    case lose
    case draw
    case invalid
}

enum Turn: String {
    case computer = "컴퓨터"
    case user = "사용자"
}

enum GameMode {
    case rockPaperScissors
    case mookJjiBba
}

class RockPaperScissors {
    var turn: Turn = .user
    
    private func printInputMessage(_ type: GameMode) {
        let message = type == .rockPaperScissors ? "가위(1), 바위(2), 보(3)! <종료 : 0>" :
        "[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>"
        
        print(message, terminator: " : ")
    }
    
    private func getUserChoice(_ mode: GameMode) -> Choice? {
        printInputMessage(mode)
        
        guard let input = readLine(), let choiceNumber = Int(input), let choice = Choice(rawValue: choiceNumber) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            
            if mode == .mookJjiBba { turn = .computer }
            
            return getUserChoice(mode)
        }
        
        return choice
    }
    
    private func checkWinner(_ userChoice: Choice) -> Result {
        guard let computerChoice = Choice(rawValue: Int.random(in: 1...3)) else { return .invalid }
        
        let resultValue = (userChoice.rawValue - computerChoice.rawValue + 3) % 3
        
        switch resultValue {
            case 0:
                return .draw
            case 1:
                return .win
            case 2:
                return .lose
            default:
                return .invalid
        }
    }
    
    private func handleResult(_ result: Result, mode: GameMode) {
        let messages: [Result: String] = [
            .win: "이겼습니다!",
            .lose: "졌습니다!",
            .draw: "비겼습니다!",
            .invalid: "잘못된 결과입니다."
        ]
        
        if mode == .rockPaperScissors {
            print(messages[result] ?? "잘못된 결과입니다.")
        } else {
            if result == .win {
                turn = .user
            } else if result == .lose {
                turn = .computer
            } else {
                return
            }
            
            print("\(turn.rawValue)의 턴입니다.")
        }
    }
        
    private func startMookJjiBba() {
        while let userChoice = getUserChoice(.mookJjiBba), userChoice != .end {
            let resultMookJjiBba = checkWinner(userChoice)
            handleResult(resultMookJjiBba, mode: .mookJjiBba)
                        
            if resultMookJjiBba == .draw {
                print("\(turn.rawValue)의 승리!")
                break
            } else if resultMookJjiBba == .invalid {
                break
            }
        }
    }

    func start() {
        while let userChoice = getUserChoice(.rockPaperScissors), userChoice != .end {
            let resultRockPaperScissors = checkWinner(userChoice)
            handleResult(resultRockPaperScissors, mode: .rockPaperScissors)
            
            if resultRockPaperScissors != .draw {
                startMookJjiBba()
                break
            }
        }
        
        print("게임 종료")
    }
}
