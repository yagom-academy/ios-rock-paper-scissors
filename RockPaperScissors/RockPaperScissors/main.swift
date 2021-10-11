var playerInput: String = ""

func varifyInputValue(input: String) {
    guard let inputNumber = Int(input), inputNumber > 0, inputNumber < 4 else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return
    }
}

func startReceiveInput() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    
    guard let input: String = readLine(), input != "0" else {
        print("게임 종료")
        return
    }
    
    playerInput = input
}


func startProgram() {
    startReceiveInput()
    varifyInputValue(input: playerInput)
    
}

startProgram()
