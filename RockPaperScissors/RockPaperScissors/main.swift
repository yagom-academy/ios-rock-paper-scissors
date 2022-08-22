import Foundation

enum RSP: String {
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}


func bringUserInput() -> Int {
    guard let userInput = readLine() else { return 404 }
    guard let userInput = Int(userInput) else { return 404 }
    return userInput
}

func generateComputerInput() -> Int {
    let computerInput = Int.random(in: 1...3)
    print(computerInput)
    return computerInput
}

func rockScissorsPaper() {
    print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
    let userInput = bringUserInput()
    let computerInput = generateComputerInput()
    print(decideWinLose(userInput, computerInput))
}

func decideWinLose(_ userInput: Int, _ computerInput: Int) -> String{
    let checkNumber = userInput - computerInput
    if checkNumber == 0 {
        return "비겼습니다!"
    }else if checkNumber == 1 || checkNumber == -2 {
        return "이겼습니다!"
    }else{
        return "졌습니다!"
    }
}

rockScissorsPaper()
