var playerNumber: Int = 0

func startReceiveInput() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    guard let input: String = readLine(), input != "0" else {
        print("게임 종료")
        return
    }
    varifyInputValue(input: input)
}

func varifyInputValue(input: String) {
    guard let inputNumber = Int(input), inputNumber > 0, inputNumber < 4 else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startReceiveInput()
        return
    }
    playerNumber = inputNumber
    startGame()
}

func startGame() {
    var computerNumber: Int = Int.random(in: 1...3)
    changeOneToFour(computerNumber: &computerNumber)
    compareNumbers(with: computerNumber)
}

func changeOneToFour(computerNumber: inout Int) {
    if playerNumber == 1, computerNumber == 3 {
        playerNumber += 3
    } else if playerNumber == 3, computerNumber == 1 {
        computerNumber += 3
    }
}

func compareNumbers(with computerNumber: Int) {
    if playerNumber == computerNumber {
        print("비겼습니다!")
        startReceiveInput()
        return
    } else if playerNumber > computerNumber {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
}

startReceiveInput()
