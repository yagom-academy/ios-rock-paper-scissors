import Foundation

let end = 0, scissors = 1, rock = 2, paper = 3

enum GameResult {
    case computerWin, draw, userWin
}

func getRandomNumber() -> Int {
    return Int.random(in: scissors...paper)
}

func inputUserNumber() -> Int {
    showMenuMessage()
        
    guard let userInput = readLine(),
            let intUserInput = Int(userInput),
          intUserInput >= end && intUserInput <= paper else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        return inputUserNumber()
    }

    return intUserInput
}

func startRockPaperScissors() {
    let userInput = inputUserNumber()
    
    if userInput == 0 {
        print("게임종료")
    } else {
        let gameResult = compareNumber(number: userInput)
        
        switch gameResult {
        case .computerWin:
            print("졌습니다")
        case .draw:
            print("비겼습니다")
            startRockPaperScissors()
        case .userWin:
            print("이겼습니다")
        }
    }
}

func showMenuMessage() {
    let menuMessage = "가위(1), 바위(2), 보(3)! <종료: 0> :"
    
    print(menuMessage, terminator: " ")
}

func compareNumber(number: Int) -> GameResult {
    let computerNumber = getRandomNumber()
    let compareNumbers = (user: number, computer: computerNumber)
    
    switch compareNumbers {
    case (scissors, rock), (rock, paper), (paper, scissors):
        return GameResult.computerWin
    case (rock, scissors), (paper, rock), (scissors, paper):
        return GameResult.userWin
    default:
        return GameResult.draw
    }
}

startRockPaperScissors()
