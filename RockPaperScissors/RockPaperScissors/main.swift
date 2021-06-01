var userChoice: String = ""
var computerChoice: Int = 0

func startGame() -> Void {
    print(showStartMessage(), terminator: "")
    recieveInput()
    if userChoice == "" {
        return
    }
    judgeWinner()

}

func showStartMessage() -> String {
    return "가위(1), 바위(2), 보(3)! <종료 : 0> : "
}

func recieveInput() -> Void {
    let input = readLine()
    testValid(of: input)
}

func testValid(of input: String?) {
    switch input {
    case "0":
        print("게임 종료")
        return
    case "1":
        userChoice = "1"
    case "2":
        userChoice = "2"
    case "3":
        userChoice = "3"
    default:
        print(showErrorMessage())
        startGame()
    }
}

func showErrorMessage() -> String {
    return "잘못된 입력입니다. 다시 시도해주세요."
}

func judgeWinner() -> Void {
    setComputerChoice()

    if userChoice == String(computerChoice) {
        print("비겼습니다!")
        startGame()
    } else {
        pickWinner()
        startGame()
    }
}

func setComputerChoice() {
    computerChoice = Int.random(in: 1...3)
}

func pickWinner() -> Void{
    switch userChoice {
    case "1" where (computerChoice == 3):
        print("이겼습니다!")
    case "2" where (computerChoice == 1):
        print("이겼습니다!")
    case "3" where (computerChoice == 2):
        print("이겼습니다!")
    default:
        print("졌습니다!")
    }

}

startGame()
