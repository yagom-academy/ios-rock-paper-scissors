func startGame() {
    var isRunning = GameResult.draw
    
    while isRunning == .draw {
        let randomComputerNumber = Int.random(in: 1...3)
        
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let userNumber = fetchUserInput(),
              let userChoice = RockPaperScissors.init(rawValue: userNumber),
              let computerChoice = RockPaperScissors.init(rawValue: randomComputerNumber),
              0...3 ~= userNumber else {
            printUserInputError()
            continue
        }
        
        if userNumber == 0 { break }
        
        isRunning = checkGameResult(computerChoice: computerChoice, userChoice: userChoice)
    }
    playGame(gameResult: isRunning)
}

func printUserInputError() {
    print("잘못된 입력입니다. 다시 시도해주세요")
}

func checkGameResult(computerChoice: RockPaperScissors, userChoice: RockPaperScissors) -> GameResult {
    if computerChoice == userChoice {
        print("비겼습니다")
        return .draw
    }
    
    switch userChoice {
    case .scissors:
        if computerChoice == .rock {
            print("졌습니다!")
            return .lose
        }
    case .rock:
        if computerChoice == .paper {
            print("졌습니다!")
            return .lose
        }
    case .paper:
        if computerChoice == .scissors {
            print("졌습니다!")
            return .lose
        }
    }
    
    print("이겼습니다!")
    return .win
}

func fetchUserInput() -> Int? {
    guard let userInput = readLine(),
          let userNumber = Int(userInput) else { return nil }
    
    return userNumber
}
