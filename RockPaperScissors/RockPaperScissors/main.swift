import Foundation

var computerNumber: Int = 0

enum GameResult {
    case computerWin, draw, userWin
}

func getRandomNumber() {
    computerNumber = Int.random(in: 1...3)
}

func userMakeNumber() -> Int {
    showMenuMessage()
    
    if let userInput = readLine() {
        if let intUserInput = Int(userInput) {
            return intUserInput
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return userMakeNumber()
        }
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return userMakeNumber()
    }
}

func startGame() {
    let userInput = userMakeNumber()
    
    switch userInput {
    case 0:
        print("게임종료")
    case 1...3:
        let gameResult = compareNumber(number: userInput)
        
        if gameResult == .computerWin {
            print("졌습니다")
        } else if gameResult == .userWin {
            print("이겼습니다")
        } else {
            print("비겼습니다")
            startGame()
        }
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
    }
}

func showMenuMessage() {
    let menuMessage = "가위(1), 바위(2), 보(3)! <종료: 0> :"
    
    print(menuMessage, terminator: " ")
}

func compareNumber(number: Int) -> GameResult {
    getRandomNumber()

    if number == 1 && computerNumber == 2 {
        return GameResult.computerWin
    } else if number == 1 && computerNumber == 3 {
        return GameResult.userWin
    } else if number == 2 && computerNumber == 3 {
        return GameResult.computerWin
    } else if number == 2 && computerNumber == 1 {
        return GameResult.userWin
    } else if number == 3 && computerNumber == 1 {
        return GameResult.computerWin
    } else if number == 3 && computerNumber == 2 {
        return GameResult.userWin
    } else {
        return GameResult.draw
    }
}

startGame()
