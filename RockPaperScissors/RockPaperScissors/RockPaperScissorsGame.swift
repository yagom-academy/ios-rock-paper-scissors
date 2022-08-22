enum RockPaperScissors: Int {
    case scissors = 1
    case rock
    case paper
}

func startGame() {
    var isGame = true
    while isGame {
        let randomComputerNumber = Int.random(in: 1...3)
        
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        guard let userNumber = fetchUserInput(), 0...3 ~= userNumber else {
            print("잘못된 입력입니다. 다시 시도해주세요")
            continue
        }
        if userNumber == 0 {
            print("게임 종료")
            break
        }
        guard let userChoice = RockPaperScissors.init(rawValue: userNumber),
              let computerChoice = RockPaperScissors.init(rawValue: randomComputerNumber) else {
            print("잘못된 입력입니다. 다시 시도해주세요")
            continue
        }
        isGame = resultRps(computerChoice: computerChoice, userChoice: userChoice)
    }
}

func resultRps(computerChoice: RockPaperScissors, userChoice: RockPaperScissors) -> Bool {
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
        print("이겼습니다!")
        return false
    case .rock:
        if computerChoice == .paper {
            print("졌습니다!")
            return false
        }
        print("이겼습니다!")
        return false
    case .paper:
        if computerChoice == .scissors {
            print("졌습니다!")
            return false
        }
        print("이겼습니다!")
        return false
    }
}

func fetchUserInput() -> Int? {
    guard let userInput = readLine(), let userNumber = Int(userInput) else {
        return nil
    }
    
    return userNumber
}
