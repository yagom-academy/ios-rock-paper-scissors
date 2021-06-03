import Foundation

func startGame() {
    let userCard = userInput()
    processSeparator(userCard: userCard)
}

func userInput() -> Int {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
    
    guard let stringInput = readLine(), let intInput = Int(stringInput) else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        
        return userInput()
    }
    return intInput
}

func processSeparator(userCard: Int) {
    let exitNumber = 0
    
    switch userCard {
    case exitNumber:
        print("게임종료")
    case 1, 2, 3:
        judgeResult(inputCard: userCard)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return startGame()
    }
}

func generateComputerCard() -> Int {
    return Int.random(in: 1...3)
}

func judgeResult(inputCard: Int) {
    let randomComputerCard = generateComputerCard()
    let judgingIndicator = inputCard - randomComputerCard
    
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

