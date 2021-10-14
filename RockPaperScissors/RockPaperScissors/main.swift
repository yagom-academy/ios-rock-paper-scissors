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

enum Choice: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
    case exit = 0
}

enum ErrorMessage: Error {
    case wrongInput
    case systemError
}

struct RockPaperScissorsGame {
    private var generatedChoiceOfComputer: Int {
        return Int.random(in: 1...3)
    }
    
    func startGame() {
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
        
        if choiceOfComputer == userChoice {
            printGameResult(gameResult: .draw)
            selectUserChoice()
        } else if userChoice == choiceOfComputer + 1 || userChoice == choiceOfComputer - 2 {
            printGameResult(gameResult: .win)
            printGameResult(gameResult: .exit)
        } else {
            printGameResult(gameResult: .lose)
            printGameResult(gameResult: .exit)
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


let rockPaperScissors = RockPaperScissorsGame()
rockPaperScissors.startGame()
