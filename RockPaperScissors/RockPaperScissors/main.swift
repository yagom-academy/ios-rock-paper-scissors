var userChoice: String = ""
var computerChoice: Int = 0

func startGame() -> Void {
    print(showStartMessage(), terminator: "")
    recieveInput()
    if userChoice == "" {
        return
    }
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
    return "잘못된 입력입니다. 다시 시도해주세요."}
	}
startGame()
