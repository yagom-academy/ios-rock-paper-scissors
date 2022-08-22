func displayGameMessege() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ")
}

func inputUserSelction() -> String? {
    return readLine()
}

func judgeValidInput(userInput: String?) -> Int? {
    switch userInput {
    case "0":
        return 0
    case "1":
        return 1
    case "2":
        return 2
    case "3":
        return 3
    default:
        return nil
    }
}

func generateRandomComputerHand() -> Int {
    return (1...3).shuffled()[0]
}

func judgeWin(userInput: Int?, computerHand: Int) {
    if userInput != nil {
        print("judge")
    } else {
        print("fail")
    }
}

func startGame() {
    displayGameMessege()
    judgeWin(
        userInput: judgeValidInput(userInput: inputUserSelction()),
        computerHand: generateRandomComputerHand()
    )
}

startGame()
