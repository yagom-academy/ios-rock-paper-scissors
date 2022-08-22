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
        return nil
    }
}

func generateRandomComputerHand() -> Int {
    return (1...3).shuffled()[0]
}

func judgeWin(userInput: Int, computerHand: Int) -> Int {
    if userInput == computerHand {
        return 0
    } else if userInput == 1 && computerHand == 3{
        print("이겼습니다!")
        return 0
    }
    
/*
 1. 가위 vs 보
 2. 가위 vs 주먹
 3. 보 vs 주먹
 */
    
    return 0
}

func startGame() {
    displayGameMessege()
    
    guard let userInput = judgeValidInput(userInput: inputUserSelction()) else {
        return startGame()
    }
    
    if userInput == 0 {
        return
    } else {
        judgeWin(userInput: userInput, computerHand: generateRandomComputerHand())
    }
}

startGame()
