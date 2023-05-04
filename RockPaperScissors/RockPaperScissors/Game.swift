class Game {
    var turn: Turn = .user
    
    private func printInputMessage(for mode: GameMode) {
        let message = mode == .rockPaperScissors
            ? "가위(1), 바위(2), 보(3)! <종료 : 0>"
            : "[\(turn.rawValue) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>"
        
        print(message, terminator: " : ")
    }
    
    private func getUserChoice(for mode: GameMode) -> Choice {
        printInputMessage(for: mode)
        
        guard let input = readLine(), let choiceNumber = Int(input),
              let choice = Choice(rawValue: choiceNumber) else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            
            if mode == .mookJjiBba { turn = .computer }
            
            return getUserChoice(for: mode)
        }
        
        return choice
    }
    
    private func determineWinner(_ userChoice: Choice) -> Result {
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
    
    private func printResult(_ result: Result, for mode: GameMode) {
        if mode == .rockPaperScissors {
            turn = result == .win ? .user : .computer
            print(result.message)
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
        
    private func playMookJjiBba() {
        while true {
            let userChoice = getUserChoice(for: .mookJjiBba)
            
            if userChoice == .end {
                print("게임 종료")
                break
            }
            
            let result = determineWinner(userChoice)
            displayResult(result, for: .mookJjiBba)
                        
            if result == .draw {
                print("\(turn.rawValue)의 승리!")
                break
            }
        }
    }
    
    func start() {
        while true {
            let userChoice = getUserChoice(for: .rockPaperScissors)
            
            if userChoice == .end {
                print("게임 종료")
                break
            }
            
            let resultRockPaperScissors = determineWinner(userChoice)
            displayResult(resultRockPaperScissors, for: .rockPaperScissors)
            
            if resultRockPaperScissors != .draw {
                playMookJjiBba()
                break
            }
        }
    }
}
