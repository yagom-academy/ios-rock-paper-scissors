

func startGame() {
    var isRunning = true
    
    while isRunning {
        let randomComputerNumber = Int.random(in: 1...3)
        
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        
        guard let userNumber = fetchUserInput(),
              0...3 ~= userNumber else {
            printUserInputError()
            continue
        }
        
        if userNumber == 0 { break }
        
        guard let userChoice = RockPaperScissors.init(rawValue: userNumber),
              let computerChoice = RockPaperScissors.init(rawValue: randomComputerNumber) else {
            printUserInputError()
            continue
        }
        
        isRunning = checkGameResult(computerChoice: computerChoice, userChoice: userChoice)
    }
    print("게임 종료")
}

func printUserInputError() {
    print("잘못된 입력입니다. 다시 시도해주세요")
}

func checkGameResult(computerChoice: RockPaperScissors, userChoice: RockPaperScissors) -> Bool {
    if computerChoice == userChoice {
        print("비겼습니다")
        return true
    }
    
    switch userChoice {
    case .scissors:
        if computerChoice == .rock {
            print("졌습니다!")
            return false
        }
    case .rock:
        if computerChoice == .paper {
            print("졌습니다!")
            return false
        }
    case .paper:
        if computerChoice == .scissors {
            print("졌습니다!")
            return false
        }
    }
    
    print("이겼습니다!")
    return false
}

func fetchUserInput() -> Int? {
    guard let userInput = readLine(),
          let userNumber = Int(userInput) else { return nil }
    
    return userNumber
}
