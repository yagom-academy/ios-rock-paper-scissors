func displayGameMessege() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ")
}

func inputUserSelction() -> String? {
    return readLine()
}

func judgeValidInput(_ userInput: String?) {
    
}

func generateRandomComputerHand() -> Int {
    return (1...3).shuffled()[0]
}
