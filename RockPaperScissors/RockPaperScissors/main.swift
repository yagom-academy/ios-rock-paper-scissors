import Foundation

var userCard: Int = 0

func startGame() {
    userCard = userInput()
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
    switch userCard {
    case 0:
        end()
    case 1:
        compareCard(inputCard: 1)
    case 2:
        compareCard(inputCard: 2)
    case 3:
        compareCard(inputCard: 3)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return startGame()
    }
}

func generateComputerCard() -> Int {
    return Int.random(in: 1...3)
}

func compareCard(inputCard: Int) {
    let computerCard = generateComputerCard()
    let judgingIndicator = inputCard - computerCard
    
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
