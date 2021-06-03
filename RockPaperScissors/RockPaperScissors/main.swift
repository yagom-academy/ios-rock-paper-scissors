enum Choice: String, CaseIterable {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

func startGame() -> Void {
    showStartMessage()
}

func showStartMessage() -> Void {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    recieveInput()
}

func recieveInput() -> Void {
    if let input = readLine() {
        testValid(of: input)
    } else {
        showErrorMessage()
        showStartMessage()
    }
}

func testValid(of input: String) -> Void {
    switch input {
    case "0":
        print("게임 종료")
        return
    case Choice.scissors.rawValue:
        judgeWinner(userChoice: Choice.scissors)
    case Choice.rock.rawValue:
        judgeWinner(userChoice: Choice.rock)
    case Choice.paper.rawValue:
        judgeWinner(userChoice: Choice.paper)
    default:
        showErrorMessage()
        showStartMessage()
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
        showStartMessage()
    } else {
        pickWinner(userChoice: userChoice, computerChoice: computerChoice)
    }
}

func generateComputerChoice() -> Choice? {
    return Choice.allCases.randomElement()
}

func pickWinner(userChoice: Choice, computerChoice: Choice) -> Void {
    switch userChoice {
    case .scissors where (computerChoice == .paper):
        print("이겼습니다!")
    case .rock where (computerChoice == .scissors):
        print("이겼습니다!")
    case .paper where (computerChoice == .rock):
        print("이겼습니다!")
    default:
        print("졌습니다!")
    }
    showStartMessage()
}

startGame()
