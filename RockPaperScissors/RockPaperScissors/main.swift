import Foundation

let end = 0, scissors = 1, rock = 2, paper = 3
var winner: String = ""
var currentGame: CurrentGame = .rockPaperScissors

enum GameResult {
    case computerWin
    case draw
    case userWin
}
enum CurrentGame {
    case rockPaperScissors
    case mukChiba
}

func getRandomNumber() -> Int {
    return Int.random(in: scissors...paper)
}

func showMenuMessage() {
    var menuMessage: String = ""
    
    if currentGame == .rockPaperScissors {
        menuMessage = "가위(1), 바위(2), 보(3)! <종료: 0> :"
    } else if currentGame == .mukChiba {
        menuMessage = "[\(winner) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :"
    }
    
    print(menuMessage, terminator: " ")
}

func inputUserNumber() -> Int {
    showMenuMessage()
        
    guard let userInput = readLine(),
          let intUserInput = Int(userInput),
          intUserInput >= end && intUserInput <= paper else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        winner = "컴퓨터"
        return inputUserNumber()
    }

    return intUserInput
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

func startRockPaperScissors() {
    let userInput = inputUserNumber()
    
    if userInput == 0 {
        print("게임종료")
    } else {
        let gameResult = compareNumber(number: userInput)
        
        switch gameResult {
        case .computerWin:
            print("졌습니다")
            winner = "컴퓨터"
            mukChiBa()
        case .draw:
            print("비겼습니다")
            startRockPaperScissors()
        case .userWin:
            print("이겼습니다")
            winner = "사용자"
            mukChiBa()
        }
    }
}

func mukChiBa() {
    currentGame = .mukChiba
    
    let userInput = inputUserNumber()
}

startRockPaperScissors()
