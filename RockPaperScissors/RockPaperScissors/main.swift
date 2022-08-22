func displayGameMessege() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ",terminator: "")
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
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return nil
    }
}

func generateRandomComputerHand() -> Int {
    return (1...3).shuffled()[0]
}

func judgeWin(userInput: Int, computerHand: Int) -> Int {
    if userInput == computerHand {
        return 2
    } else if userInput == 1 && computerHand == 3 {
        return 1
    } else if userInput == 2 && computerHand == 1 {
        return 1
    } else if userInput == 3 && computerHand == 2 {
        return 1
    } else {
        return 0
    }
}

func startGame() {
    displayGameMessege()
    
    guard let userInput = judgeValidInput(userInput: inputUserSelction()) else {
        return startGame()
    }
    
    if userInput == 0 {
        return
    }
    
    let result = judgeWin(userInput: userInput, computerHand: generateRandomComputerHand())
    
    switch result {
    case 0:
        print("졌습니다!")
        return
    case 1:
        print("이겼습니다!")
        return
    case 2:
        print("비겼습니다!")
        return startGame()
    default:
        return
    }
}

startGame()
