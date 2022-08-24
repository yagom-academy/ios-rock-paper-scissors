func playGame(gameResult: GameResult) {
    
    let isTurn: Bool = gameResult == .win ? true : false
    let randomComputerNumber = Int.random(in: 1...3)
    print(randomComputerNumber)
    print("[\(isTurn ? "사용자" : "컴퓨터")]턴 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    
    guard let userNumber = fetchUserInput(),
          let userChoice = MukChiBa.init(rawValue: userNumber),
          let computerChoice = MukChiBa.init(rawValue: randomComputerNumber),
          0...3 ~= userNumber else {
        printUserInputError()
        return playGame(gameResult: .lose)
    }
    
    if userNumber == 0 { print("게임종료") }
    
    if userChoice == computerChoice {
        print("\(isTurn ? "사용자" : "컴퓨터" )의 승리!")
        return
    }
    
    return playGame(gameResult: checkMGB(computerChoice: computerChoice, userChoice: userChoice))
}

func checkMGB(computerChoice: MukChiBa, userChoice: MukChiBa) -> GameResult {
    switch userChoice {
    case .muk:
        if computerChoice == .ba {
            return .lose
        }
    case .chi:
        if computerChoice == .muk{
            return .lose
        }
    case .ba:
        if computerChoice == .chi {
            return .lose
        }
    }
    return .win
}
