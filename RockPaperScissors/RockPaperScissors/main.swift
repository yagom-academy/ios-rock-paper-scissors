import Foundation

var userNumber: Int = 0
var computerNumber: Int = 0

func startGame() {
    userNumber = userInput()
    
    if isEnd() {
        return
    } else {
        generateComputerNumber()
        compareNumber()
    }
}

func userInput() -> Int {
    print("가위(1), 바위(2), 보(3), 종료(0)", terminator: "")
    
    guard let stringInput = readLine(), let intInput = Int(stringInput) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return userInput()
    }
    
    return Int(intInput)
}

func isEnd() -> Bool {
    if userNumber == 0 {
        print("게임 종료")
        return true
    }
    return false
}
