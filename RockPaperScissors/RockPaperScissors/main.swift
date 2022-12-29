var winner: String = ""
var currentGame: CurrentGame = .rockPaperScissors

func createRandomNumber() -> Int {
    return Int.random(in: 1...3)
}

func showMenuMessage() {
    var menuMessage: String = ""
    
    switch currentGame {
    case .rockPaperScissors:
        menuMessage = "가위(1), 바위(2), 보(3)! <종료: 0> :"
    case .mukChiba:
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
            winner = GameResult.computerWin.rawValue
        }
        return inputUserNumber()
    }
    return userInputNumber
}

func compareNumbers(userInput: Int) -> GameResult {
    let scissors = 1, rock = 2, paper = 3
    let computerNumber = createRandomNumber()
    let compareNumbers = (userNumber: userInput, computerNumber: computerNumber)
    
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
    
    let gameResult = compareNumbers(userInput: userInput)
    let gameResultAndCurrentGame = (result: gameResult, game: currentGame)
    
    switch gameResultAndCurrentGame {
    case (result: .computerWin, game: .rockPaperScissors):
        print("졌습니다")
        winner = GameResult.computerWin.rawValue
        currentGame = .mukChiba
        startGame()
    case (result: .computerWin, game: .mukChiba):
        winner = GameResult.computerWin.rawValue
        print("\(winner)의 턴입니다")
        startGame()
    case (result: .draw, game: .rockPaperScissors):
        print("비겼습니다")
        startGame()
    case (result: .draw, game: .mukChiba):
        print("\(winner)의 승리!")
    case (result: .userWin, game: .rockPaperScissors):
        print("이겼습니다")
        winner = GameResult.userWin.rawValue
        currentGame = .mukChiba
        startGame()
    case (result: .userWin, game: .mukChiba):
        winner = GameResult.userWin.rawValue
        print("\(winner)의 턴입니다")
        startGame()
    }
}

startGame()
