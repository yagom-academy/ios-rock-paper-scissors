enum Result: CustomStringConvertible {
    case win
    case draw
    case lose
    case exit
    
    var description: String {
        switch self {
        case .win : return "이겼습니다!"
        case .draw : return "비겼습니다!"
        case .lose : return "졌습니다!"
        case .exit : return "게임 종료"
        }
    }
}

enum Player: CustomStringConvertible {
    case computer
    case user
    case nobody
    
    var description: String {
        switch self {
        case .computer : return "컴퓨터"
        case .user : return "사용자"
        case .nobody: return "nobody"
        }
    }
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
            printErrorMessage(errorCase: ErrorMessage.wrongInput)
            selectUserChoice()
        } catch ErrorMessage.systemError {
            printErrorMessage(errorCase: ErrorMessage.systemError)
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
    
    private func printErrorMessage(errorCase: ErrorMessage) {
        switch errorCase {
        case .wrongInput:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        case .systemError:
            print("\n[SystemError: nil]")
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
        print(printResult)
    }
}


struct MukChiPaGame {
    init() {
        turn = Player.nobody
    }

    private enum MukChiPaChoice: Int {
        case muk = 1
        case chi = 2
        case pa = 3
        case exit = 0
    }
    
    private var generatedChoiceOfComputer: Int {
        return Int.random(in: 1...3)
    }
    
    private var turn: Player
    
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
                printErrorMessage(errorCase: ErrorMessage.wrongInput)
                turn = Player.computer
                startMukChiPa(winner: turn)
            } catch ErrorMessage.systemError {
                printErrorMessage(errorCase: ErrorMessage.systemError)
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
    
    private mutating func decideGameResult(from userChoice: Int) {
        let choiceOfComputer = generatedChoiceOfComputer

        if choiceOfComputer == userChoice {
            printVictoryMessage(winner: turn)
        } else if userChoice == choiceOfComputer - 1 || userChoice == choiceOfComputer + 2 {
            printGameTurn(gamePlayer: Player.user)
            startMukChiPa(winner: turn)
        } else {
            printGameTurn(gamePlayer: Player.computer)
            startMukChiPa(winner: turn)
        }
    }
    
    private func printVictoryMessage(winner turn: Player) {
        print("\(turn)의 승리!")
    }
    
    private func printErrorMessage(errorCase: ErrorMessage) {
        switch errorCase {
        case .wrongInput:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        case .systemError:
            print("\n[SystemError: nil]")
        }
    }
    
    private mutating func printGameTurn(gamePlayer: Player) {
        var turnPlayer: Player
        switch gamePlayer {
        case .user:
            turnPlayer = .user
        case .computer:
            turnPlayer = .computer
        case .nobody:
            return
        }
        print("\(turnPlayer)의 턴입니다")
        turn = turnPlayer
    }
}


let rockPaperScissors = RockPaperScissorsGame()
rockPaperScissors.startRockPaperScissors()
