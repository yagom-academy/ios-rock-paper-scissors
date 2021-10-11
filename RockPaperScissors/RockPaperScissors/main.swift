//var playerInput: String = ""
var playerNumber: Int = 0

func startReceiveInput() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    guard let input: String = readLine(), input != "0" else {
        print("게임 종료")
        return
    }
    varifyInputValue(input: input)
    //playerInput = input
}

func varifyInputValue(input: String) {
    guard let inputNumber = Int(input), inputNumber > 0, inputNumber < 4 else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return
    }
    
    playerNumber = inputNumber
    
}

func startProgram() {
    startReceiveInput()
    //varifyInputValue(input: playerInput)
    startGame()
    
}

func startGame() {
    let computerNumber: Int = Int.random(in: 1...3)
}

startProgram()
