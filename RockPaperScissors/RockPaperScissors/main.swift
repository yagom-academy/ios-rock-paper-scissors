import Foundation

var computerNumber: Int = 0

enum GameResult {
    case computerWin, draw, userWin
}

func getRandomNumber() {
    computerNumber = Int.random(in: 1...3)
}

func startGame() {

    showMenuMessage()
    
    if let userInput = Int(readLine()!) {
        switch userInput {
        case 0:
            print("게임종료")
        case 1...3:
            compareNumber(number: userInput)
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            startGame()
        }
    }
}

func showMenuMessage() {
    let menuMessage = "가위(1), 바위(2), 보(3)! <종료: 0> :"
        
    print(menuMessage, terminator: " ")
}

func compareNumber(number: Int) {
    getRandomNumber()
    
    if number == computerNumber {
        print("비겼습니다!")
        startGame()
    }
    
    if number == 1 && computerNumber == 2 {
        print("졌습니다!")
    } else if number == 1 && computerNumber == 3 {
        print("이겼습니다!")
    } else if number == 2 && computerNumber == 3 {
        print("졌습니다!")
    } else if number == 2 && computerNumber == 1 {
        print("이겼습니다!")
    } else if number == 3 && computerNumber == 1 {
        print("졌습니다!")
    } else if number == 3 && computerNumber == 2 {
        print("이겼습니다!")
    }
}

startGame()
