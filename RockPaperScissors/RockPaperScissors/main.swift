import Foundation

let computer = "컴퓨터"
let user = "사용자"
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

func createRandomNumber() -> Int {
    return Int.random(in: 1...3)
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
          let userInputNumber = Int(userInput),
          0...3 ~= userInputNumber else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        
        if currentGame == .mukChiba {
            winner = computer
        }
        return inputUserNumber()
    }
    return userInputNumber
}

func compareAandComputer(A number: Int) -> GameResult {
    let scissors = 1, rock = 2, paper = 3
    let computerNumber = createRandomNumber()
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

func startGame() {
    let userInput = inputUserNumber()
    
    guard userInput != 0 else {
        print("게임종료")
        return
    }
    
    let gameResult = compareAandComputer(A: userInput)
        
    switch gameResult {
    case .computerWin:
        if currentGame == .rockPaperScissors {
            print("졌습니다")
            winner = computer
            currentGame = .mukChiba
            startGame()
        } else if currentGame == .mukChiba {
            winner = computer
            print("\(winner)의 턴입니다")
            startGame()
        }
    case .draw:
        if currentGame == .rockPaperScissors {
            print("비겼습니다")
            startGame()
        } else if currentGame == .mukChiba {
            print("\(winner)의 승리!")
        }
    case .userWin:
        if currentGame == .rockPaperScissors {
            print("이겼습니다")
            winner = user
            currentGame = .mukChiba
            startGame()
        } else if currentGame == .mukChiba {
            winner = user
            print("\(winner)의 턴입니다")
            startGame()
        }
    }
}

startGame()
