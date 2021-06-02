import Foundation

var userNumber: Int = 0

func startGame() {
    userNumber = userInput()
    whoWin()

}

func userInput() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
    
    guard let stringInput = readLine(), let intInput = Int(stringInput) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        
        return userInput()
    }
    return intInput
}


func end() {
    print("게임 종료")
    
    return
}

func whoWin() {
    switch userNumber {
    case 0:
        end()
    case 1:
        compareNumber(inputNumber: 1)
    case 2:
        compareNumber(inputNumber: 2)
    case 3:
        compareNumber(inputNumber: 3)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return startGame()
    }
}

func generateComputerNumber() -> Int {
    return Int.random(in: 1...3)
}

func compareNumber(inputNumber: Int) {
    let computerNumber = generateComputerNumber()
    let judgingIndicator = inputNumber - computerNumber
    
    if judgingIndicator == 0 {
        print("비겼습니다.")
        return startGame()
    } else if judgingIndicator == -1 || judgingIndicator == 2 {
        print("졌습니다!")
        return startGame()
    } else {
        print("이겼습니다!")
        return startGame()
    }
}

startGame()
