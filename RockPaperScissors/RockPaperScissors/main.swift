var userChoice: String = ""
var computerChoice: Int = 0

func startGame() -> Void {
    print(showStartMessage(), terminator: "")
    recieveInput()
}

func showStartMessage() -> String {
    return "가위(1), 바위(2), 보(3)! <종료 : 0> : "
}

func recieveInput() -> Void {
    let input = readLine()
}

startGame()
