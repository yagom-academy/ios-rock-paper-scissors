enum Result: CustomStringConvertible {
    var description: String {
        switch self {
        case .win : return "이겼습니다!"
        case .draw : return "비겼습니다!"
        case .lose : return "졌습니다!"
        case .exit : return "게임 종료"
        }
    }
    case win
    case draw
    case lose
    case exit
}

enum Player: CustomStringConvertible {
    var description: String {
        switch self {
        case .computer : return "컴퓨터"
        case .user : return "사용자"
      }
    }
    case computer
    case user
}

enum ErrorMessage: Error {
    case wrongInput
    case systemError
}

struct RockPaperScissorsGame {
    private enum Choice: Int {
        case scissors = 1
        case rock = 2
        case paper = 3
        case exit = 0
    }
    
    private var generatedChoiceOfComputer: Int {
        return Int.random(in: 1...3)
    }
    
    func startRockPaperScissors() {
        selectUserChoice()
    }
    
    private func receiveInput() throws -> String {
        guard let input = readLine() else {
            throw ErrorMessage.systemError
        }
        return input
    }
    
    private func selectUserChoice() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
        
        do {
            let inputUserChoice = try receiveInput()
            try checkValidInput(from: inputUserChoice)
        } catch ErrorMessage.wrongInput {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            selectUserChoice()
        } catch ErrorMessage.systemError {
            print("[SystemError: nil]")
        } catch {
            print(error)
        }
    }
    
    private func checkValidInput(from userChoice: String) throws {
        guard let userChoice = Int(userChoice) else {
            throw ErrorMessage.wrongInput
        }
        
        guard userChoice == Choice.scissors.rawValue || userChoice == Choice.rock.rawValue || userChoice == Choice.paper.rawValue || userChoice == Choice.exit.rawValue else {
            throw ErrorMessage.wrongInput
        }
        
        guard userChoice == Choice.exit.rawValue else {
            decideGameResult(from: userChoice)
            return
        }
        printGameResult(gameResult: .exit)
    }
    
    private func decideGameResult(from userChoice: Int) {
        let choiceOfComputer = generatedChoiceOfComputer
        var mukChiPaGame = MukChiPaGame()
        
        if choiceOfComputer == userChoice {
            printGameResult(gameResult: .draw)
            selectUserChoice()
        } else if userChoice == choiceOfComputer + 1 || userChoice == choiceOfComputer - 2 {
            printGameResult(gameResult: .win)
            mukChiPaGame.startMukChiPa(winner: Player.user)
        } else {
            printGameResult(gameResult: .lose)
            mukChiPaGame.startMukChiPa(winner: Player.computer)
        }
    }
    
    private func printGameResult(gameResult: Result) {
        var printResult: Result
        switch gameResult {
        case .win:
            printResult = .win
        case .lose:
            printResult = .lose
        case .draw:
            printResult = .draw
        case .exit:
            printResult = .exit
        }
        print(printResult.description)
    }
}


struct MukChiPaGame {
    private enum MukChiPaChoice: Int {
        case muk = 1
        case chi = 2
        case pa = 3
        case exit = 0
    }
    
    private var generatedChoiceOfComputer: Int {
        return Int.random(in: 1...3)
    }
    
    private var turn: Player = Player.user
    
    private func receiveInput() throws -> String {
           guard let input = readLine() else {
               throw ErrorMessage.systemError
           }
           return input
       }
    
    mutating func startMukChiPa(winner: Player) {
            turn = winner
            print("[\(turn)턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " : ")
            
            do {
                let inputUserChoice = try receiveInput()
                try checkValidInput(from: inputUserChoice)
            } catch ErrorMessage.wrongInput {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                turn = Player.computer
                startMukChiPa(winner: turn)
            } catch ErrorMessage.systemError {
                print("[SystemError: nil]")
            } catch {
                print(error)
            }
        }
    
    private mutating func checkValidInput(from userChoice: String) throws {
        guard let userChoice = Int(userChoice) else {
            throw ErrorMessage.wrongInput
        }
        
        guard userChoice == MukChiPaChoice.muk.rawValue || userChoice == MukChiPaChoice.chi.rawValue || userChoice == MukChiPaChoice.pa.rawValue || userChoice == MukChiPaChoice.exit.rawValue else {
            throw ErrorMessage.wrongInput
        }
        
        guard userChoice == MukChiPaChoice.exit.rawValue else {
            decideGameResult(from: userChoice)
            return
        }
        print(Result.exit)
    }
    
    func decideGameResult(from userChoice: Int) {
        
    }
    
}


let rockPaperScissors = RockPaperScissorsGame()
