import Foundation

func bringUserInput() -> Int {
    guard let input = readLine() else { return 404 }
    guard let userInput = Int(input) else { return 404 }
    return userInput
}

func isValidInput(input: Int) -> Bool {
    if 1...3 ~= input {
        return true
    } else {
        return false
    }
}

func generateComputerInput() -> Int {
    let computerInput = Int.random(in: 1...3)
    return computerInput
}

func rockScissorsPaper() {
    var gameStatus = true
    
    while (gameStatus) {
        print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
        let userInput = bringUserInput()
        
        if isValidInput(input: userInput) == false && userInput == 0 {
            print("게임 종료")
            return
        } else if isValidInput(input: userInput) == false && userInput != 0 {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        
        let computerInput = generateComputerInput()
        gameStatus = decideWinLose(userInput, computerInput)
    }
}

func decideWinLose(_ userInput: Int, _ computerInput: Int) -> Bool {
    let checkNumber = userInput - computerInput
    if checkNumber == 0 {
        print("비겼습니다!")
        return true
    } else if checkNumber == 1 || checkNumber == -2 {
        print("이겼습니다!")
        return false
    } else {
        print("졌습니다!")
        return false
    }
}

rockScissorsPaper()
