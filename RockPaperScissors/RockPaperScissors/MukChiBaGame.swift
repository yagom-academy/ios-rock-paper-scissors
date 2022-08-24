func playMCBGame(gameResult: GameResult) {
    let isUserTurn: Bool = gameResult == .win ? true : false
    let randomComputerNumber = Int.random(in: 1...3)

    print("[\(isUserTurn ? "사용자" : "컴퓨터") 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
    
    guard let userNumber = fetchUserInput(),
          let userChoice = MukChiBa.init(rawValue: userNumber),
          let computerChoice = MukChiBa.init(rawValue: randomComputerNumber) else {
        printUserInputError()
        return playMCBGame(gameResult: .lose)
    }
    
    let gameResult = checkMCB(computerChoice: computerChoice, userChoice: userChoice)
    
    switch gameResult {
    case .win:
        playMCBGame(gameResult: .win)
    case .lose:
        playMCBGame(gameResult: .lose)
    case .draw:
        print("\(isUserTurn ? "사용자" : "컴퓨터" )의 승리!")
        break
    case .exit:
        print("게임 종료")
        break
    }
}

func checkMCB(computerChoice: MukChiBa, userChoice: MukChiBa) -> GameResult {
    if userChoice == computerChoice { return .exit }
    
    switch userChoice {
    case .muk:
        if computerChoice == .ba { return .lose }
    case .chi:
        if computerChoice == .muk { return .lose }
    case .ba:
        if computerChoice == .chi { return .lose }
    case .none:
        return .exit
    }
    
    return .win
}
