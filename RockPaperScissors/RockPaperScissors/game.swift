class Game {
    enum Choice: String, CaseIterable {
        case scissors = "1"
        case rock = "2"
        case paper = "3"
    }
    
    enum Winner: String {
        case user = "사용자"
        case computer = "컴퓨터"
        case exit
    }
    
    var gameWinner: Winner = .user

    func startGame() -> Void {
        showStartMessage()
        recieveInput()
    }

    func showStartMessage() -> Void {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    }

    func recieveInput() -> Void {
        if let input = readLine() {
            testValid(of: input)
        } else {
            showErrorMessage()
            startGame()
        }
    }

    func testValid(of input: String) -> Void {
        switch input {
        case "0":
            print("게임 종료")
            gameWinner = .exit
            return
        case Choice.scissors.rawValue:
            judgeWinner(userChoice: Choice.scissors)
        case Choice.rock.rawValue:
            judgeWinner(userChoice: Choice.rock)
        case Choice.paper.rawValue:
            judgeWinner(userChoice: Choice.paper)
        default:
            showErrorMessage()
            startGame()
        }
    }

    func showErrorMessage() -> Void {
        print("잘못된 입력입니다. 다시 시도해주세요.")
    }

    func judgeWinner(userChoice: Choice) -> Void {
        guard let computerChoice = generateComputerChoice() else {
            return
        }
        if userChoice == computerChoice {
            print("비겼습니다!")
            startGame()
        } else {
            gameWinner = pickWinner(userChoice: userChoice, computerChoice: computerChoice)
        }
    }

    func generateComputerChoice() -> Choice? {
        return Choice.allCases.randomElement()
    }

    func pickWinner(userChoice: Choice, computerChoice: Choice) -> Winner {
        switch userChoice {
        case .scissors where (computerChoice == .paper):
            print("이겼습니다!")
            return Winner.user
        case .rock where (computerChoice == .scissors):
            print("이겼습니다!")
            return Winner.user
        case .paper where (computerChoice == .rock):
            print("이겼습니다!")
            return Winner.user
        default:
            print("졌습니다!")
            return Winner.computer
        }
    }
}
