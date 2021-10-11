import Foundation


enum Message: String {
    case win = "이겼습니다!"
    case draw = "비겼습니다!"
    case lose = "졌습니다!"
    case exit = "게임 종료"
    case wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
    case systemError = "[SystemError: nil]"
}

func startGame() {
    selectUserChoice()
}

func selectUserChoice() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
    
    guard let inputUserChoice = readLine() else {
        print("\n"+Message.systemError.rawValue)
        return
    }
    
    if let userChoice = Int(inputUserChoice) {
        checkValidInput(userChoice: userChoice)
    } else {
        print(Message.wrongInput.rawValue)
        selectUserChoice()
    }
}

func checkValidInput(userChoice: Int) {
    if userChoice == 1 || userChoice == 2 || userChoice == 3 {
        compareChoices(userChoice: userChoice)
    } else if userChoice == 0 {
        print(Message.exit.rawValue)
    } else {
        print(Message.wrongInput.rawValue)
        selectUserChoice()
    }
}

func generateChoiceOfComputer() -> Int {
    return Int.random(in: 1...3)
}

func compareChoices(userChoice: Int) {
    let choiceOfComputer = generateChoiceOfComputer()
    if choiceOfComputer == userChoice {
        print(Message.draw.rawValue)
        selectUserChoice()
    } else if userChoice == choiceOfComputer + 1 || userChoice == choiceOfComputer - 2 {
        print(Message.win.rawValue)
        print(Message.exit.rawValue)
    } else {
        print(Message.lose.rawValue)
        print(Message.exit.rawValue)
    }
}


startGame()
